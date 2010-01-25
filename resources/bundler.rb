inside 'gems/bundler' do  
  run 'git init'
  run 'git pull --depth 1 git://github.com/wycats/bundler.git' 
  run 'rm -rf .git .gitignore'
end

file 'script/bundle', %{
#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "gems/bundler/lib"))
require 'rubygems'
require 'rubygems/command'
require 'bundler'
require 'bundler/commands/bundle_command'
Gem::Commands::BundleCommand.new.invoke(*ARGV)
}.strip

run 'chmod +x script/bundle'

file 'Gemfile', %{
clear_sources
source 'http://gemcutter.org'
source 'http://gems.github.com'  

disable_system_gems

bundle_path 'gems'

gem 'rails', '#{Rails::VERSION::STRING}'
gem 'ruby-debug', :except => 'production'
}.strip
  
append_file '.gitignore', %{
gems/*
!gems/cache
!gems/bundler}

run 'script/bundle'

append_file '/config/preinitializer.rb', %{
require File.expand_path(File.join(File.dirname(__FILE__), "..", "gems", "environment"))
}

gsub_file 'config/environment.rb', "require File.join(File.dirname(__FILE__), 'boot')", %{
require File.join(File.dirname(__FILE__), 'boot')

# Hijack rails initializer to load the bundler gem environment before loading the rails environment.

Rails::Initializer.module_eval do
  alias load_environment_without_bundler load_environment
  
  def load_environment
    Bundler.require_env configuration.environment
    load_environment_without_bundler
  end
end
}