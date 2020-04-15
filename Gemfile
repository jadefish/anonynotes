source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# Rails gems:
gem 'rails', '~> 6'
gem 'sqlite3', '~> 1'
gem 'puma', '~> 4'
gem 'sass-rails', '~> 6'
gem 'listen', '~> 3', require: false
gem 'bootsnap', '~> 1', require: false

group :development, :test do
  gem 'pry', require: false
  gem 'pry-byebug', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw], require: false
end

group :test do
  gem 'rspec', '~> 3'
  gem 'simplecov', '~> 0', require: false
end

# Application gems:
gem 'fts_lite', '~> 0'
gem 'spicy-proton', '~> 2'
