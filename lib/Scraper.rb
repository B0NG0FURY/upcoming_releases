require 'open-uri'

class Scraper
    def self.scrape_release_page(release_url)
        doc = Nokogiri::HTML(open(release_url))
        result = []
        doc.css("div.product-page div.uk-grid div.album").each do |album|
            info = {
                :name = album.css("h5").text,
                :artist = album.css("h4 a").text,
                :label = album.css("h6 a").text,
                :info_url = album..css("a")[0]["href"]
            }
            result << info
        end
        result
    end
end

#bands = doc.css("div.product-page div.uk-grid div.album")
#artist = bands.css("h4 a").text
#album = bands.css("h5").text
#label = bands.css("h6 a").text
#info_page = bands.css("a")[0]["href"]