begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'active_record'
require 'active_record/version'
require 'action_controller'
require 'action_view'
require 'action_mailer'


ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection({:adapter => 'sqlite3', :database => ':memory:'})
ActiveRecord::Schema.define do
    create_table :people do |table|
        table.column :hair, :string
        table.column :hair_color, :string
    end
end

require 'validate_block'
