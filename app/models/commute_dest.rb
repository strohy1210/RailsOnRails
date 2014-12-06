require 'haversine'
require 'pry'
require 'rest_client'

class CommuteDest

  attr_accessor :latitude, :longitude, :query, :close_lines, :address, :max_price

  def initialize(query, x)
    @query = query
    @max_price = x
    result = Geocoder.search(@query)

    @latitude= result.first.data["geometry"]["location"]["lat"]
    @longitude= result.first.data["geometry"]["location"]["lng"]
    @address = result.first.data["formatted_address"]
    if result.first.data["types"][0] == "street_address"
       @address_num = result.first.data["address_components"][0]["long_name"]
       @road = result.first.data["address_components"][1]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    elsif result.first.data["types"].size === 3
      @address_num =result.first.data["address_components"][1]["long_name"]
      @road = result.first.data["address_components"][2]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    else
      @address_num = result.first.data["address_components"][2]["long_name"]
      @road = result.first.data["address_components"][3]["long_name"].gsub("Street", "st").downcase.split.join("%20")
    end
  end

  def close_lines
   #check to see if new york
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

   url = "http://streeteasy.com/for-rent/nyc/status:open%7Cprice:-#{@max_price}%7Cbeds:1%7Ccommute:1800:#{@address_num}%20#{@road},%20new%20york,%20ny%7Ctransit_distance:0.3%7Ctransit_lines:#{lines}"

  end


end



