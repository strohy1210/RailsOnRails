require 'haversine'
require 'pry'

class CommuteDest

  attr_accessor :latitude, :longitude, :query, :close_lines
  
  def initialize(query)
    @query = query
    result = Geocoder.search(@query)
    @latitude= result.first.data["geometry"]["location"]["lat"]
    @longitude= result.first.data["geometry"]["location"]["lng"]
  end

  def close_lines
   
    # commute_dest = [@latitude, @longitude]
     close_lines =[]
    Stop.all.each do |stop|
      distance = Haversine.distance(stop.lat, stop.long, @latitude, @longitude)
      if distance.to_miles < 0.31 

        close_lines << stop.route.split(",")
      end
    end
    close_lines.flatten.uniq.map {|el| el.strip}.uniq
  end

  def urlify
    lines= close_lines.join(",")
    "http://streeteasy.com/for-rent/nyc/status:open%7Cprice:-2500%7Cbeds:1%7Ccommute:1800:11%20broadway,%20new%20york,%20ny%7Ctransit_distance:0.3%7Ctransit_lines:#{lines}"
  end


end

 # CommuteDest.new("169 Canterbury Rd, White Plains, NY")
 # => #<CommuteDest:0x007fa7a4d7fb10 @query="169 Canterbury Rd, White Plains, NY", @latitude=41.043824, @longitude=-73.81676999999999>





