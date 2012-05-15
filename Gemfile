require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'jquery-rails'
gem "devise", ">= 2.1.0.rc"
gem "simple_form"
gem "will_paginate", ">= 3.0.3"
gem 'pg', '0.12.2'
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "cancan", ">= 1.6.7"
gem "rolify", ">= 3.1.0"
gem "geocoder", "~> 1.1.1"
gem "breadcrumbs_on_rails"
gem "rack-pjax"

group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "bootstrap-sass", ">= 2.0.2"
end

group :development, :test do
  gem "rspec-rails", ">= 2.9.0.rc2"
  gem "factory_girl_rails", ">= 3.2.0"
end

group :test do
  gem "email_spec", ">= 1.2.1" 
  gem 'capybara', '1.1.2'
end

group :development do
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-rspec", ">= 0.4.3"
  gem 'annotate', '~> 2.4.1.beta'
end

#Ensure that only the relevant gems are loaded depending upon the OS
case HOST_OS
  when /darwin/i
    #gem 'rb-fsevent', :group => :development
    #gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end