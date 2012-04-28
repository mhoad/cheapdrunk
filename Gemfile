require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'sqlite3'
gem 'jquery-rails'
gem "devise", ">= 2.1.0.rc"
gem "simple_form"
gem "will_paginate", ">= 3.0.3"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
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
end

group :development do
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-rspec", ">= 0.4.3"
end

#Ensure that the relevant gems are loaded depending upon the OS
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end