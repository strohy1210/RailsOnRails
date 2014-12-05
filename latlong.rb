require 'haversine'
require 'pry'


# distance = Haversine.distance(35.61488, 139.5813, 48.85341, 2.3488)
# binding.pry
# lat1,long1,lat2,long2
close_lines = []
commute_dest = [lat, long]
Stop.each do |stop|
  distance = Haversine.distance(stop.lat, stop.long, commute_dest)
  if distance.to_miles < 0.31 && !close_lines.include? stop.route
    close_lines << stop.route
  end
  close_lines.uniq
end
