class SearchController < ApplicationController
  def search

    Apartment.clear
    # @read_timeout = 120
    @commute_dest = CommuteDest.new(params[:q], params[:x])
    # @max_time = CommuteDest.new(params[:t])
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
