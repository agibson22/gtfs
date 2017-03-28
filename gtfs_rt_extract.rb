require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

gtfs_rt_url = "http://api.octa.net/GTFSRealTime/protoBuf/VehiclePositions.aspx"

data = Net::HTTP.get(URI.parse(gtfs_rt_url))
feed = Transit_realtime::FeedMessage.decode(data)
for entity in feed.entity do
	if entity.field?(:vehicle)
		p "Trip ID: #{entity.vehicle.trip.trip_id}"
		p "Vehicle ID: #{entity.vehicle.vehicle.id}"
		p "Current Position: #{entity.vehicle.position.latitude}, #{entity.vehicle.position.longitude}, #{entity.vehicle.position.bearing}"
		# p entity.vehicle.position
	end
end