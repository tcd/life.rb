source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.3", ">= 6.0.3.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails"

# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password
# gem "image_processing", "~> 1.2" # Use Active Storage variant
gem "pg", ">= 0.18", "< 2.0" # Use postgresql as the database for Active Record
gem "puma", "~> 4.1" # Use Puma as the app server
# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "sass-rails", ">= 6" # Use SCSS for stylesheets
gem "turbolinks", "~> 5" # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "webpacker", "~> 4.0" # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw] # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "simplecov", "~> 0.19.0"
end

group :development do
  gem "web-console", ">= 3.3.0" # Access an interactive console on exception pages or by calling "console" anywhere in the code.
end
