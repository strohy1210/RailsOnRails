class Apartment
  require 'open-uri'
  require 'date'
  attr_accessor :photo_url, :price, :neighborhood, :link

  @@apartments = []
  # def self.find_se_rentals(url)
  #      binding.pry
  #     encoded_url = URI.encode(url)
  #     info_hash = JSON.load(open(encoded_url))["search_url"]

  #     {median_price: info_hash["median_price"], search_url: info_hash["search_url"]}
  # end
  def self.all
    @@apartments
  end
  def self.clear
    @@apartments.clear
  end
  def initialize(photo_url, price, neighborhood, link)
    @photo_url=photo_url
    @price=price
    @neighborhood =neighborhood
    @link=link
    @@apartments << self
  end

  def self.get_links(url)
    @listing_urls =[]
    @@listing_page.css('#result-details .photo a').each do |listing|
        l = listing.attributes["href"].value
        @listing_urls << "http://streeteasy.com#{l}"
      end
    @listing_urls
  end
  
  def self.noko_listings(url)
    @@listing_page = Nokogiri::HTML(open(url))     
  end

   def self.get_photos(url)
    @listing_photos =[]

      @@listing_page.css('#result-details .photo img').each do |listing|
        @listing_photos << listing.attributes['data-original'].value
      end
      @listing_photos
   end

   def self.get_prices(url)
      @listing_prices =[] 
      @@listing_page.css('div#result-details .price-info .price').each do |listing|
        @listing_prices << listing.text
      end
      @listing_prices
    end

    def self.get_neighborhoods(url)
      @listing_neighborhoods = []
      @@listing_page.css('div#result-details .details_info a').each do |listing|
        @listing_neighborhoods << listing.text
      end
      @listing_neighborhoods
    end
    

end