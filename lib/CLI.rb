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

    def artist_list
       list = Album.all.sort_by {|album| album.artist}
       list.each_with_index do |album, i|
        puts "#{i + 1}. Artist: #{album.artist}   Album: #{album.name}   Label: #{album.label}"
       end
       input = ""
       until input >= 0 && input < list.count
        puts "Enter number of album for more information"
        input = gets.strip.to_i - 1
        album = list[input]
        puts "LP: #{album.lp[price]}, #{album.lp[release_date]}"
        puts "CD: #{album.cd[price]}, #{album.cd[release_date]}"
        puts "MP3: #{album.mp3[price]}, #{album.mp3[release_date]}"
        puts " "
        puts "#{album.description}"
       end
    end

    def label_list
        list = Album.all.sort_by {|album| album.label}
        list.each_with_index do |album, i|
         puts "#{i + 1}. Label: #{album.label}   Artist: #{album.artist}   Album: #{album.name}"
        end
        input = ""
        until input >= 0 && input < list.count
         puts "Enter number of album for more information"
         input = gets.strip.to_i - 1
         album = list[input]
         puts "LP: #{album.lp[price]}, #{album.lp[release_date]}"
         puts "CD: #{album.cd[price]}, #{album.cd[release_date]}"
         puts "MP3: #{album.mp3[price]}, #{album.mp3[release_date]}"
         puts " "
         puts "#{album.description}"
        end
     end
end