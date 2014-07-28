require 'rubygems'
require 'bundler/setup'

require 'require_all'
require 'mongoid'
require 'pry'
require 'hashie'
# require 'faker'
require 'active_support/core_ext/integer/time'
require 'active_support/core_ext/numeric/time'

Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml", :development)
require_all 'lib'

puts Taxonomies::Catagory.destroy_all
puts Taxonomies::Type.destroy_all
puts Taxonomies::Classification.destroy_all
puts Taxonomies::Specialization.destroy_all
