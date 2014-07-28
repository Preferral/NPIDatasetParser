require "#{File.dirname(__FILE__)}/config/development.rb"

processor = DataProcessing::Processor.new({csv_name: DATAFILE_NAME, num_threads: 20})
processor.iterate

include Providers
include Locations
include Taxonomies
binding.pry
