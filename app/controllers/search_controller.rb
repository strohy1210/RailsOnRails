class SearchController < ApplicationController
  def search

    # raise params.inspect
    Apartment.clear
    # @read_timeout = 120
    @commute_dest = CommuteDest.new(params[:q], params[:x], params[:t])
    url = @commute_dest.urlify
      Apartment.noko_listings(url)
   
    @photos = Apartment.get_photos(url)
    @prices = Apartment.get_prices(url)
    @neighborhoods = Apartment.get_neighborhoods(url)
    @urls = Apartment.get_links(url)

    @addresses = Apartment.get_addresses(url)

    @photos.size.times do
      i = Apartment.all.size
      Apartment.new(@photos[i], @prices[i], @neighborhoods[i], @urls[i], @addresses[i])
    end

    @apartments = Apartment.all
  end

end
