class SearchController < ApplicationController
  def search
    @commute_dest = CommuteDest.new(params[:q])
    #incorporate price params into everything
    url = @commute_dest.urlify

    Apartment.noko_listings(url)
  end
end
