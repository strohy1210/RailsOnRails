class SearchController < ApplicationController
  def search
    
    @read_timeout = 120
    @commute_dest = CommuteDest.new(params[:q])
    #incorporate price params into everything
    url = @commute_dest.urlify
    Apartment.noko_listings(url)
    @photos = Apartment.get_photos(url)
    @prices = Apartment.get_prices(url)
    @neighborhoods = Apartment.get_neighborhoods(url)

    @photos.size.times do
      i = Apartment.all.size
      Apartment.new(@photos[i], @prices[i], @neighborhoods[i])
    end
    
    @apartments = Apartment.all
  end
end
