require 'rubygems'
require 'zip'

gtfs_file = 'google_bus.zip'

Zip::File.open(gtfs_file) do |zip_file|
	# Handle entries one by one
	zip_file.each do |entry|
		# Extract to file/directory/symlink
		puts "Extracting #{entry.name}"
		# entry.extract(dest_file)

		# Read into memory
		# content = entry.get_input_stream.read
	end
end