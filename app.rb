require "#{File.dirname(__FILE__)}/config/development.rb"

puts "\n$$$$$$$$$$$$$$$$$$"
puts DateTime.now
puts "$$$$$$$$$$$$$$$$$$\n"

num_threads = 10

$processed_count_array = Array.new(num_threads) { 0 }

processor = DataProcessing::Processor.new({csv_name: DATAFILE_NAME, num_threads: num_threads})
processor.iterate

print $processed_count_array

puts "\n$$$$$$$$$$$$$$$$$$"
puts DateTime.now
puts "$$$$$$$$$$$$$$$$$$\n"

include Providers
include Locations
include Taxonomies
binding.pry
