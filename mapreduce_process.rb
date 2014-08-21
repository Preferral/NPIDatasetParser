require "#{File.dirname(__FILE__)}/config/development.rb"
require 'csv'
require 'thread'

puts "STDIN Printing"

puts "\n$$$$$$$$$$$$$$$$$$"
puts DateTime.now
puts "$$$$$$$$$$$$$$$$$$\n"

puts "PROCESS: #{Process.pid}"

taxonomies = DataProcessing::TaxonomyCache.new


input = Queue.new
threads = []
num_threads = 10
@pushing_finished = false
@threads_processing = Array.new(num_threads) { false }


@counted = 0

# Producer Thread
# Read from the STDIN and add to a buffered input queue (glorified array)
threads << Thread.new(input) do |ip|
  puts "Starting producer loop"
  loop do
    unless ip.size > 100
      if line = STDIN.gets
        @counted += 1
        # puts "Read #{@counted} #{ip.size}"
        ip.push(line)
        # sleep(0.05)
      else
        @pushing_finished = true
        break
      end
    end
  end
end

# Consumer Threads
num_threads.times do |i|

  # Handle the input passed by the reader thread
  threads << Thread.new(input) do |ip|
    puts "Starting consumer loop #{i}"
    loop do
      if ip.size == 0 and @pushing_finished and !@threads_processing.reduce { |e,r| e && r }
        sleep(3)
        Thread.exit
      else
        unless ip.empty?
          @threads_processing[i] = true
          row = ip.pop

          row_object = DataProcessing::Stream::RowObjectBuilder.new(row, taxonomies)
          row_object.objectify
          @threads_processing[i] = false
        end
      end
    end
  end
end

puts "Joining threads"
threads.map(&:join)

puts "\n$$$$$$$$$$$$$$$$$$"
puts DateTime.now
puts "$$$$$$$$$$$$$$$$$$\n"