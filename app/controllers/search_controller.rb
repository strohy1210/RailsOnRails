class SearchController < ApplicationController
  def search
    @commute_dest = CommuteDest.new(params[:q])
    @close_lines = @commute_dest.close_lines
    @url = @commute_dest.urlify
  
  end
end
