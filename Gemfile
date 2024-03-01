source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "ransack", "~> 4.1.1"
gem 'pagy', '~> 6.4'
gem 'figaro'
gem "puma", "~> 5.0"
gem 'bcrypt_pbkdf', '~> 1.1'
gem 'net-ssh', '>= 6.0.2'
gem 'ed25519', '>= 1.2', '< 2.0'
gem 'sshkit-sudo'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
