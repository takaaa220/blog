source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
gem 'mysql2'
gem 'slim-rails'
gem 'puma', '~> 3.11'
gem 'webpacker'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'mini_magick', '~> 4.8'
gem 'carrierwave'
gem 'draper'
gem 'ransack'
gem 'kaminari'
gem 'rails-i18n'
gem 'meta-tags'
gem 'gretel'
gem 'redcarpet'
gem 'coderay'

group :development do
  gem "capistrano", "~> 3.11", require: false
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano-rbenv-vars'
  gem 'capistrano3-puma'
end

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'           # コンソールをirbからpryに置き換える。
  gem 'pry-byebug'          # ソースコードにブレークポイントを埋め込んで、所定のポイントでpryを起動
end

group :development do
  gem 'better_errors'
  gem 'brakeman'
  gem 'rails_best_practices'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'bullet'              # 「N+1 問題」を検出してくれる
  gem 'letter_opener_web'   # 送信したメールを確認できる
end

group :test do
  gem "rspec_junit_formatter"
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
