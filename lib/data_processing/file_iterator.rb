require 'csv'

module DataProcessing
  class FileIterator
    def initialize(options = {})
      options.reverse_merge({})
      @csv_name           = options.fetch(:csv_name)
      @thread_number      = options.fetch(:thread_number)
      @number_of_threads  = options.fetch(:thread_count)
    end

    def iterate_and_call(*methods)
      CSV.foreach(@csv_name) do |row|
        @row_index = $.
        process(row, methods) if row_assigned? && @row_index != 1
        puts "\t\t\t#{@row_index}" if @row_index % 100 == 0 and row_assigned?
        break if @row_index > 1000
        raise "Wrong Size" if row.size != 329
      end
    end

    private

    def process(row, methods)
      row_object = RowObjectBuilder.new(row)
      row_object.objectify
      # sleep 0.3
      # puts "processing"
      # methods.each do |method|
        # rp.send(method)
      # end
    end

    def row_assigned?
      @row_index % @number_of_threads - @thread_number == 0
    end
  end
end
