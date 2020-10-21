require_relative "../lib/scraper.rb"
require_relative "../lib/album.rb"
require 'nokogiri'

class CommandLineInterface
    ALBUM_URL = "https://www.midheaven.com"

    def get_albums
        albums = Scraper.scrape_release_page(ALBUM_URL + "/upcoming-releases")
        Album.create_albums(albums)
    end

    def add_info
        Album.all.each do |album|
            info = Scraper.scrape_info_page(ALBUM_URL + album.info_url)
            album.add_album_info(info)
        end
    end

    
end