# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
  rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "errship3"
  gem.homepage = "https://github.com/dynamicguy/errship3"
  gem.license = "MIT"
  gem.summary = %Q{Errship3 is a Rails 3.2 engine for rendering error pages inside your layout.}
  gem.description = %Q{Errship3 is a Rails 3.2 engine for rendering error pages inside your layout. It supports i18n, custom exceptions, and Airbrake (Hoptoad) error tracking.}
  gem.email = ["Nurul Ferdous", "lkoester@agoragames.com", "mwilson@agoragames.com", "dczarnecki@agoragames.com"]
  gem.authors = ["nurul@ferdo.us", "Logan Koester", "Matthew Wilson", "David Czarnecki"]
  gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*", "{public}/**/*"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "errship3 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
