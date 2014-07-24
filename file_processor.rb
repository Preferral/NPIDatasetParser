require 'benchmark'
require 'csv'

DATAFILE_NAME = "../data/npidata_20050523-20140413.csv"

# def parse(csv, thread_index, num_threads)
#   limit = (8000 / num_threads)
#   csv.each_line.with_index do |line, line_index|
#     if (line_index % num_threads - thread_index) == 0
#       values = line.split(",")
#       if limit == (8000 / num_threads) || limit == (8000 / num_threads - 1)
#         print values
#         print "\n"
#       end
#       if values.size != 329
#         puts values.size
#         print values

#         print "\n"
#         print line
#         print "\n"
#       end
#       limit = limit - 1
#       sleep (0.02)
#       if limit < 0
#         break
#       end
#     end
#   end
# end


#
# ThreadedCSVProcessor class
#
class ThreadedCSVProcessor
  def initialize(csv_name, num_threads)
    @csv_name = csv_name
    @number_of_threads = num_threads
    @threads = Array.new
  end

  def iterate
    create_threads
    join_threads
  end

  private

  def create_threads
    @number_of_threads.times do |thread_number|
      @threads[thread_number] = Thread.new { new_iterator(thread_number) }
    end
  end

  def join_threads
    @threads.each do |thread|
      thread.join
    end
  end

  def new_iterator(thread_number)
    iterator = ThreadedCSVIterator.new(@csv_name, thread_number, @number_of_threads)
    iterator.iterate_and_call(:geocode, :save)
  end
end


#
# ThreadedCSVIterator class
#
class ThreadedCSVIterator
  def initialize(csv_name, thread_number, number_of_threads)
    @csv_name = csv_name
    @thread_number = thread_number
    @number_of_threads = number_of_threads
  end

  def iterate_and_call(*methods)
    CSV.foreach(@csv_name) do |row|
      @row_index = $.
      process(row, methods) if row_assigned?
      break if @row_index > 180
      raise "Wrong Size" if row.size != 329
    end
  end

  private

  def process(row, methods)
    rp = RowProcessor.new(row)
    sleep 0.3
    # puts "processing"
    methods.each do |method|
      rp.send(method)
    end
  end


  def row_assigned?
    @row_index % @number_of_threads - @thread_number == 0
  end
end


#
# RowProcessor class
#
class RowProcessor
  def initialize(row)
    @row = Row.new(row)
  end


  def geocode

  end


  def save

  end
end


#
# Row class
#
class Row
  def initialize(row)
    @values = row#.split(",")
    puts @values[5]
    if @values.size != 329
      puts @values.size
      print @values

      print "\n"
      print row
      print "\n"
    end
  end

  def geocode

  end

  def save

  end
end


def benchmark(*thread_counts)
  puts Process.pid

  Benchmark.bm do |x|
    thread_counts.each do |count|
      x.report do
        processor = ThreadedCSVProcessor.new(DATAFILE_NAME, count)
        processor.iterate
      end
    end
  end
end

def run(num)
  puts Process.pid

  processor = ThreadedCSVProcessor.new(DATAFILE_NAME, num)
  processor.iterate
end

benchmark(10, 20, 30)
# run(20)




class Numeric
  def to_rad
    self * Math::PI / 180
  end
end

# http://www.movable-type.co.uk/scripts/latlong.html
# loc1 and loc2 are arrays of [latitude, longitude]
def distance(loc1, loc2)
  lat1, lon1 = loc1
  lat2, lon2 = loc2
  dLat = (lat2-lat1).to_rad;
  dLon = (lon2-lon1).to_rad;
  a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(lat1.to_rad) * Math.cos(lat2.to_rad) *
    Math.sin(dLon/2) * Math.sin(dLon/2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  d = 3958.756 * c; # Multiply by 3958.756 to get Miles
end
