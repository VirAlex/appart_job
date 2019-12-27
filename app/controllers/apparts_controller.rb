class AppartsController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
  def index
      set_price
  end






private

def set_price
  @price = []
  html_doc = Nokogiri::HTML(open('https://www.logic-immo.com/location-immobilier-paris-75,100_1/options/groupprptypesids=1/pricemin=1/pricemax=900/areamin=1/nbrooms=1,2/order=reco_seo_desc'))
      html_doc.search('.offer-list-item .offer-price span').each do |element|
        @price << element.text.strip
        # puts element.attribute('href').value
      end
  puts @price
end

end
