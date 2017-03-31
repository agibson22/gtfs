require 'rubygems'
require 'zip'
require 'smarter_csv'

gtfs_file = 'gtfs.zip'

# build directory in /feeds
directory_name = "feeds/#{gtfs_file}"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

Zip::File.open(gtfs_file) do |zip_file|

	zip_file.each do |entry|
		# extract to file/directory/symlink
		puts "Extracting #{entry.name}"
		# replace with agency.name
		entry.extract("#{directory_name}/#{entry.name}") unless File.exists?("#{directory_name}/#{entry.name}")
	end
end

# # make it a csv
# File.rename("#{directory_name}/routes.txt", "#{directory_name}/routes.csv") unless File.exists?("#{directory_name}/routes.csv")

# # get ish from the csv
# csv_routes = "#{directory_name}/routes.csv"
# routes = SmarterCSV.process(csv_routes)

# # finding a route by id
# p routes.find { |x| x[:route_id] == 57 }

# make it a csv
File.rename("#{directory_name}/shapes.txt", "#{directory_name}/shapes.csv") unless File.exists?("#{directory_name}/shapes.csv")

# get ish from the csv
csv_shapes = "#{directory_name}/shapes.csv"
shapes = SmarterCSV.process(csv_shapes)

# finding a route by id
# p shapes.find { |x| x[:shape_id] == 110 }
# oof gonna need to db this crap




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