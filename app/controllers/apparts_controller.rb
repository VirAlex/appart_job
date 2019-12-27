class AppartsController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
  def index
      # set_price
      # set_city
      set_m2
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

def set_city
    @city = []
    html_doc = Nokogiri::HTML(open('https://www.logic-immo.com/location-immobilier-paris-75,100_1/options/groupprptypesids=1/pricemin=1/pricemax=900/areamin=1/nbrooms=1,2/order=reco_seo_desc'))
      html_doc.search('.offer-list-item .offer-details-location-half span').each do |element|
        @city << element.text.strip
      end
  puts @city
end

def set_m2
    @m2 = []
    html_doc = Nokogiri::HTML(open('https://www.logic-immo.com/location-immobilier-paris-75,100_1/options/groupprptypesids=1/pricemin=1/pricemax=900/areamin=1/nbrooms=1,2/order=reco_seo_desc'))
      html_doc.search('.offer-list-item .offer-details-caracteristik--area span').each do |element|
        @m2 << element.text.strip
      end
end


end


offer-details-caracteristik--area
