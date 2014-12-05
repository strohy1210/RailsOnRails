class Apartment
  require 'open-uri'
  require 'date'
  attr_accessor :photo_url, :price, :neighborhood

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
  def initialize(photo_url, price, neighborhood)
    @photo_url=photo_url
    @price=price
    @neighborhood =neighborhood
    @@apartments << self
  end

  def self.generate_listing_info(url)
    self.noko_listings(url)
    @photos = self.get_photos(url)
    @prices = self.get_prices(url)
    @neighborhoods = self.get_neighborhoods(url)
    # self.get_listing_count(url)
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

    # def self.get_listing_count(url)
    #   # @listing_count = listings_page.css('.result-count').text
    # end

  #     if listings_page.css(".left-two-thirds .photo img").first
  #       if listings_page.css(".left-two-thirds .photo img")[2]
  #         ret_hash[:img_url_1] = listings_page.css(".left-two-thirds .photo img")[2].attributes["data-original"].value
  #       end
  #       if listings_page.css(".left-two-thirds .photo img")[3]
  #         ret_hash[:img_url_2] = listings_page.css(".left-two-thirds .photo img")[3].attributes["data-original"].value
  #       end
  #       if listings_page.css(".left-two-thirds .photo img")[4]
  #         ret_hash[:img_url_3] = listings_page.css(".left-two-thirds .photo img")[4].attributes["data-original"].value
  #       end
  #     else
  #       ret_hash[:img_url_1] = "apt-stock-photo-1.jpg"
  #       ret_hash[:img_url_2] = "apt-stock-photo-2.jpg"
  #       ret_hash[:img_url_3] = "apt-stock-photo-3.jpg"
  #     end

  #     root_url = "http://streeteasy.com"
        
  #     # was janky to get nokogiri to pull links and images from same listing, hence the seemingly random array values  
  #     if listings_page.css(".details-title a")[4]
  #       append_url_1 = listings_page.css(".details-title a")[4].attributes["href"].value
  #       ret_hash[:listing_url_1] = root_url + append_url_1
  #       if listings_page.css(".price")[2]
  #         ret_hash[:monthly_rent_1] = listings_page.css(".price")[2].children.text
  #       end
  #     end

  #     if listings_page.css(".details-title a")[6]
  #       append_url_2 = listings_page.css(".details-title a")[6].attributes["href"].value
  #       ret_hash[:listing_url_2] = root_url + append_url_2
  #       if listings_page.css(".price")[3]
  #         ret_hash[:monthly_rent_2] = listings_page.css(".price")[3].children.text
  #       end
  #     end

  #     if listings_page.css(".details-title a")[8]
  #       append_url_3 = listings_page.css(".details-title a")[8].attributes["href"].value
  #       ret_hash[:listing_url_3] = root_url + append_url_3
  #       if listings_page.css(".price")[4]
  #         ret_hash[:monthly_rent_3] = listings_page.css(".price")[4].children.text
  #       end
  #     end
      
  #     ret_hash[:search_url] = se_hash[:search_url]
  #     ret_hash[:median_rent] = prettify_median_price(se_hash[:median_price])
  #     ret_hash[:median_rent_integer] = se_hash[:median_price]
  #     ret_hash
  # end


end