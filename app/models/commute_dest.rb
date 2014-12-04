require 'haversine'
require 'pry'
require 'rest_client'

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
    lines= self.close_lines.join(",")
    url = "http://streeteasy.com/for-rent/nyc/status:open%7Cprice:-2500%7Cbeds:1%7Ccommute:1800:11%20broadway,%20new%20york,%20ny%7Ctransit_distance:0.3%7Ctransit_lines:#{lines}"
    # response = RestClient.get 'url'
    # binding.pry
  end


end



