class Apartment
  require 'open-uri'
  require 'date'
  attr_accessor :photo_url, :price, :neighborhood, :link, :address

  @@apartments = []

  def self.all
    @@apartments
  end
  def self.clear
    @@apartments.clear
  end
  def initialize(photo_url, price, neighborhood, link, address)
    @photo_url=photo_url
    @price=price
    @neighborhood =neighborhood
    @link=link
    @address=address
    @@apartments << self
  end


  def self.noko_listings(url)
    @@listing_page = Nokogiri::HTML(open(url))     
  end

  def self.get_links(url)
    @@listing_page.css('#result-details .photo a').map do |listing|
      l = listing.attributes["href"].value
      "http://streeteasy.com#{l}"
    end
  end

  def self.get_addresses(url)
    @@listing_page.css('.details-title').map do |listing|
      listing.css('a').first.text
    end
  end


  def self.get_photos(url)
    @@listing_page.css('#result-details .photo img').map do |listing|
      listing.attributes['data-original'].value
    end  
  end

  def self.get_prices(url)
    @@listing_page.css('div#result-details .price-info .price').map do |listing|
      listing.text
    end
  end

  def self.get_neighborhoods(url)
    @@listing_page.css('div#result-details .details_info a').map do |listing|
      listing.text
    end
  end
    

end