class AppartsController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
  def index
      # set_price
      # set_city
      # set_m2
      # set_room
      set_all
      @appart = Appart.all
      @photo = Photo.all

      #   Appart.create!(
      # title: item.css(".s-access-title").text.strip,
      # price: item.css(".s-price").text.to_d,
      # rating: item.css("span+ .a-text-normal").text.to_f)
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

    def set_room
      @rooms = []
      html_doc = Nokogiri::HTML(open('https://www.logic-immo.com/location-immobilier-paris-75,100_1/options/groupprptypesids=1/pricemin=1/pricemax=900/areamin=1/nbrooms=1,2/order=reco_seo_desc'))
        html_doc.search('.offer-list-item .offer-details-caracteristik--rooms span').each do |element|
          puts element.text.strip
        end
    end

    def set_all
      Appart.destroy_all
      Photo.destroy_all
       html_doc = Nokogiri::HTML(open('https://www.logic-immo.com/location-immobilier-lyon-tous-codes-postaux,424_99/options/groupprptypesids=1/pricemin=1/pricemax=900/areamin=1/nbrooms=1,2/order=reco_seo_desc'))
          apparts = html_doc.css('.offer-list-item')
          img = html_doc.css('.thumb-link img')
          apparts.each do |element|
            Appart.create!(
            price:    element.css(".offer-price").text.strip,
            ville:    element.css(".offer-details-location-half").text.strip,
            surface:  element.css(".offer-details-caracteristik--area").text.strip,
            pieces:   element.css(".offer-details-caracteristik--rooms").text.strip
            )
            # puts element.css(".offer-details-caracteristik")[0]["href"]
          end
            img.each do |l|
            Photo.create!(
            url:    l.attr('data-original')
            )
          end
    end
end
