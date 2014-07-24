require 'rubygems'
require 'bundler/setup'

require 'require_all'
require 'mongoid'
require 'pry'
# require 'faker'
require 'active_support/core_ext/integer/time'
require 'active_support/core_ext/numeric/time'

Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml", :development)
require_all 'lib'

DATAFILE_NAME = "#{File.dirname(__FILE__)}/data/npidata_20050523-20140413.csv"

processor = DataProcessing::Processor.new({csv_name: DATAFILE_NAME, num_threads: 20})
processor.iterate

binding.pry