module DataProcessing
  module Stream
    class Processor
      def initialize(options = {})
        options.reverse_merge({
          num_threads: 1
        })

        @number_of_threads  = options.fetch(:num_threads)
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
        iterator = DataProcessing::Stream::Iterator.new({
          thread_number:  thread_number,
          thread_count:   @number_of_threads
        })
        iterator.iterate_and_call(:geocode, :save)
      end
    end
  end
end
