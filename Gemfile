source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.1.2'
gem 'devise'
gem 'rails_admin'
gem 'figaro'
gem 'fog-aws'
gem 'carrierwave'
gem 'mini_magick'
gem 'puma', '~> 3.7'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'will_paginate-bootstrap'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'chartkick', '~> 2.2', '>= 2.2.4'
gem 'groupdate'
gem 'rack-cors'
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
gem 'acts_as_favable'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'high_voltage'
gem 'jquery-rails'
group :development do
  gem 'better_errors'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'hirb'
  gem 'hub', :require=>nil
  gem 'rails_layout'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
