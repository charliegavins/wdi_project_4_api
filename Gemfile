source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'figaro'
gem 'active_model_serializers'
gem 'rack-cors'
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'config', '~> 1.0'
gem 'blockchain', '~> 1.1', '>= 1.1.1'
gem 'shotgun', '~> 0.9.1'
gem 'unirest'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'ngrok-tunnel'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
