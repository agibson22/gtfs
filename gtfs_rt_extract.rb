require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

gtfs_rt_url = "http://api.octa.net/GTFSRealTime/protoBuf/VehiclePositions.aspx"

data = Net::HTTP.get(URI.parse(gtfs_rt_url))
feed = Transit_realtime::FeedMessage.decode(data)
vehicle_hashes = []
feed.entity[0..10].each do |v|
	if v.field?(:vehicle)
		vehicle_info = { 
			"id" => v.vehicle.vehicle.id,
			"lat" => v.vehicle.position.latitude,
			"long" => v.vehicle.position.longitude
			}
		vehicle_hashes << vehicle_info
	end
end
p vehicle_hashes.size









# for entity in feed.entity do
# 	if entity.field?(:vehicle)
# 		p "Trip ID: #{entity.vehicle.trip.trip_id}"
# 		p "Vehicle ID: #{entity.vehicle.vehicle.id}"
# 		p "Current Position: #{entity.vehicle.position.latitude},
# 			#{entity.vehicle.position.longitude},
# 			#{entity.vehicle.position.bearing}"
# 		# p entity.vehicle.position
# 		p entity.vehicle
# 	end
# end