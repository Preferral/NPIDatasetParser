require "#{File.dirname(__FILE__)}/config/development.rb"

puts "\n$$$$$$$$$$$$$$$$$$"
puts DateTime.now
puts "$$$$$$$$$$$$$$$$$$\n"

num_threads = 10

# processor = DataProcessing::FileProcessor.new({csv_name: DATAFILE_NAME, num_threads: num_threads})
# processor.iterate
states = ARGV.map(&:upcase)
state_npi_files = states.map { |s| { s => File.open("#{File.dirname(__FILE__)}/data/states/#{s}_provider_npis.csv", 'w') } }.reduce(&:merge)

@count = 0
CSV.foreach(DATAFILE_NAME) do |row|
  @row_index = $.
  @count += 1

  puts @row_index

  row_object = DataProcessing::File::Row.new(row)
  if row_object.active? && states.include?(row_object.practice_state)
    puts "#{@count} - #{row_object.practice_state} - #{row_object.provider_name}"
    state_npi_files[row_object.practice_state].puts row.to_csv
    # f.puts row.join(',')
  end
end
