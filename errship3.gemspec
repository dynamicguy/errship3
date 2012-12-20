# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "errship3"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["nurul@ferdo.us", "Logan Koester", "Matthew Wilson", "David Czarnecki"]
  s.date = "2012-12-20"
  s.description = "Errship3 is a Rails 3.2 engine for rendering error pages inside your layout. It supports i18n, custom exceptions, and Airbrake (Hoptoad) error tracking."
  s.email = ["Nurul Ferdous", "lkoester@agoragames.com", "mwilson@agoragames.com", "dczarnecki@agoragames.com"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "app/assets/javascripts/application.js",
    "app/assets/stylesheets/errship3.css",
    "app/views/errship3/standard.html.erb",
    "config/locales/en.yml",
    "config/routes.rb",
    "lib/errship3.rb",
    "lib/rescuers/active_record.rb",
    "lib/rescuers/mongo_mapper.rb",
    "lib/rescuers/mongoid.rb"
  ]
  s.homepage = "https://github.com/dynamicguy/errship3"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Errship3 is a Rails 3.2 engine for rendering error pages inside your layout."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.6.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.6.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.6.0"])
  end
end

