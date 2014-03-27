require 'rescuers/active_record' if defined?(::ActiveRecord)
require 'rescuers/mongoid' if defined?(::Mongoid)
require 'rescuers/mongo_mapper' if defined?(::MongoMapper)

module Errship3
  class Engine < ::Rails::Engine
    paths['app/routes']      = 'config/routes.rb'
    paths['app/views']      << 'app/views'
    paths['config/locales'] << 'config/locales'
  end
  
  mattr_accessor :status_code_success
  @@status_code_success = true

  module Rescuers
    def self.included(base)
      unless Rails.application.config.consider_all_requests_local
        base.rescue_from ActionController::RoutingError, :with => :render_404_error
        base.rescue_from ActionController::UnknownController, :with => :render_404_error
        base.rescue_from ::AbstractController::ActionNotFound, :with => :render_404_error
      end
    end

    def render_error(exception, errship3_scope = false)
      airbrake_class.send(:notify, exception) if airbrake_class
      render :template => '/errship3/standard', :locals => {
        :status_code => 500, :errship3_scope => errship3_scope }, :status => (Errship3.status_code_success ? 200 : 500)
    end

    def render_404_error(exception = nil, errship3_scope = false)
      render :template => '/errship3/standard', :locals => {
        :status_code => 404, :errship3_scope => errship3_scope }, :status => (Errship3.status_code_success ? 200 : 404)
    end

    # A blank page with just the layout and flash message, which can be redirected to when
    # all else fails.
    def errship3_standard(errship3_scope = false)
      flash[:error] ||= I18n.t('errship3.standard')
      render :template => '/errship3/standard', :locals => {
        :status_code => 500, :errship3_scope => errship3_scope }
    end

    # Set the error flash and attempt to redirect back. If RedirectBackError is raised,
    # redirect to error_path instead.
    def flashback(error_message, exception = nil)
      airbrake_class.send(:notify, exception) if airbrake_class
      flash[:error] = error_message
      begin
        redirect_to :back
      rescue ActionController::RedirectBackError
        redirect_to error_path
      end
    end

  private
    def airbrake_class
      return Airbrake if defined?(Airbrake)
      return HoptoadNotifier if defined?(HoptoadNotifier)
      return false
    end

  end
end
