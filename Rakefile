require 'rubygems'
gem 'activerecord', '>= 2.1.0'
gem 'rspec', '>= 1.3.0'
require 'fileutils'
require './lib/validate_block'

Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec
