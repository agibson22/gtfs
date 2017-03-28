require 'rubygems'
require 'zip'

gtfs_file = 'google_bus.zip'

# build directory in /feeds
directory_name = "feeds/#{gtfs_file}"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

Zip::File.open(gtfs_file) do |zip_file|

	zip_file.each do |entry|
		# extract to file/directory/symlink
		puts "Extracting #{entry.name}"
		#replace with agency.name
		entry.extract("feeds/#{gtfs_file}/#{entry.name}")
	end
end

# save entries to db?
# make top level directory the name of the agency
# create text file for vehicles
# create text file for vehicle assignments
# build function to allow for vehicle assignment
# show GTFS-RT on a map
# show vehicle assignments with GTFS-RT
# create text file for drivers
# create text file for driver assignments
# build function to allow for driver assignment
# show driver assignment on map