source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.3", ">= 6.0.3.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails"

gem "aws-sdk-s3", require: false # Use S3 with ActiveStorage
gem "bookmark_machine", "~> 0.0.1" # Reads and writes netscape bookmark files
# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password
gem "flat_file", "~> 0.3.0" # Convenience methods for reading CSV, TSV, & JSON files
gem "gemoji", "~> 4.0.0.rc2" # Character information and metadata for standard and custom emoji
gem "httparty", "~> 0.18.1" # HTTP client
gem "image_processing", "~> 1.2" # Use Active Storage variant
gem "lograge" # Tame Rails' multi-line logging into a single line per request
gem "nilify_blanks", "~> 1.4" # Automatically convert blank values to nil (So we don't junk up our DB)
gem "pg", ">= 0.18", "< 2.0" # Use postgresql as the database for Active Record
gem "pg_search", "~> 2.3" # Define ActiveRecord scopes that take advantage of PostgreSQL's full text search
gem "puma", "~> 4.1" # Use Puma as the app server
# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "sass-rails", ">= 6" # Use SCSS for stylesheets
gem "trestle", "~> 0.9.3" # Admin dashboard
gem "trestle-active_storage", "~> 3.0" # ActiveStorage integration for Trestle
gem "trestle-search", "~> 0.4.2" # Search plugin for Trestle
gem "turbolinks", "~> 5" # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "view_component", "~> 2.19" # https://github.com/github/view_component
gem "webpacker", "~> 4.0" # Transpile app-like JavaScript

group :development, :test do
  gem "dotenv-rails", "~> 2.7" # Load .env files
  gem "pry", "~> 0.13.1" # Better rails console
end

group :development do
  gem "annotate", "~> 3.1" # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema
  gem "pry-rails", "~> 0.3.9" # Better rails console
end

group :test do
  gem "capybara", "~> 3.33"
  gem "simplecov", "~> 0.19.0" # Generates test coverage reports
end
