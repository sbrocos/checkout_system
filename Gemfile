# frozen_string_literal: true

# Gemfile
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'rspec'
end



