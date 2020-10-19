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

    def self.scrape_info_page(info_url)
        doc = Nokogiri::HTML(open(info_url))
        info = {}
        description = doc.css("div.item-meta p").text
        doc.css("div.item").each do |format|
            type = format.css("h5").text.downcase
            type = type.split(" ")
            if type[0] == "2xlp"
                type[0] = "lp"
            end
            date = format.css("p").text
            date = date.slice(0..9)
            if type[0] == "lp" || type[0] == "cd" || type[0] == "mp3"
                info[type[0].to_sym] = {
                  :price => type[1],
                  :release_date => date
                }
            end
        end
        info[:description] = description
        info
    end
end

#Release Page-
#bands = doc.css("div.product-page div.uk-grid div.album")
#artist = bands.css("h4 a").text
#album = bands.css("h5").text
#label = bands.css("h6 a").text
#info_page = bands.css("a")[0]["href"]

#Album info page-
#album = doc.css("div.item").each do |format|
  #type = format.css("h5").text
  #type = type.split(" ")
  #date = format.css("p").text
  #date = date.slice(0..9)
  #formats[type[0].to_sym] = {
      #:price => type[1],
      #:release_date => date
    }