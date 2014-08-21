require 'rubygems'
require 'bundler/setup'
require 'dotenv'

Dotenv.load

require 'require_all'
require 'mongoid'
require 'geocoder'
require 'pry'
require 'hashie'
require 'csv'
# require 'faker'
require 'active_support/core_ext/integer/time'
require 'active_support/core_ext/numeric/time'

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml", :production)
require_all 'lib'

# DATAFILE_NAME = "#{File.dirname(__FILE__)}/../data/npidata_20050523-20140713.csv"
DATAFILE_NAME = "#{File.dirname(__FILE__)}/../data/small.csv"
TAXONOMY_FILE_NAME = "#{File.dirname(__FILE__)}/../data/taxonomies.json"

puts "Initializing Geocoder with DSTK..."
# Geocoder.configure(:lookup => :dstk, :host => "http://ec2-54-83-59-183.compute-1.amazonaws.com/")
Geocoder.configure(
  :lookup => :dstk,
  :host => "http://dstk-lb-1122339968.us-east-1.elb.amazonaws.com/",
  :timeout => 2
)
