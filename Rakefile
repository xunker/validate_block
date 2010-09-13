require 'rubygems'
gem 'hoe', '>= 2.1.0'
gem 'activerecord', '>= 2.1.0'
gem 'rspec', '>= 1.3.0'
require 'hoe'
require 'fileutils'
require './lib/validate_block'

VERSION = "0.2.0"

Hoe.plugin :newgem

$hoe = Hoe.spec 'validate_block' do
  self.developer 'Matthew Nielsen', 'xunker@pyxidis.org'
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec
