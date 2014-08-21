module DataProcessing
  module Stream
    class Iterator
      def initialize(options = {})
        options.reverse_merge({})
        @thread_number      = options.fetch(:thread_number)
        @number_of_threads  = options.fetch(:thread_count)
      end

      def iterate_and_call(*methods)
        STDIN.each_with_index do |row, index|
          unless index == 0
            puts "On row: #{index} of STDIN"
            @row_index = index
            # sleep 0.02 if row_assigned?
            process(row, methods) if row_assigned? && @row_index != 1
            # puts @row_index if row_assigned?
            $processed_count_array[@row_index % @number_of_threads] += 1 if row_assigned?
            # puts "\t\t\t#{@row_index}" if @row_index % 100 == 0 and row_assigned?
            break if @row_index > 4000
            # puts "ROW SIZE: #{row.size}"
            # raise "Wrong Size" if row.size != 329
          end
        end
      end

      private

      def process(row, methods)
        row_object = DataProcessing::Stream::RowObjectBuilder.new(row)
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
end
