require_relative "../lib/scraper.rb"
require_relative "../lib/album.rb"
require 'nokogiri'

class CommandLineInterface
    ALBUM_URL = "https://www.midheaven.com"

    def run
        get_albums
        add_info
        list_albums
    end

    def list_albums
        puts "To see upcoming releases in order of artist enter 'list artist'."
        puts "To see upcoming releases in order of record label enter 'list label'."
        puts "Or enter 'exit' to leave program'."
        input = ""
        until input = "exit"
            input = gets.strip
            if input = "list artist"
                artist_list
            elsif input = "list label"
                label_list
            end
        end
    end

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
        print_info(album)
       end
       decision_loop
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
         print_info(album)
        end
     end

     def print_info(album)
         puts "LP: #{album.lp[:price]}, #{album.lp[:release_date]}"
         puts "CD: #{album.cd[:price]}, #{album.cd[:release_date]}"
         puts "MP3: #{album.mp3[:price]}, #{album.mp3[:release_date]}"
         puts " "
         puts "#{album.description}"
         puts "--------------------"
     end

     def decision_loop
        puts "Enter 'back' to view more upcoming album releases."
        puts "Or enter 'exit' to leave program"
        input = ""
        until input = "exit"
         input = gets.strip
         if input = "back"
             list_albums
         end
        end
     end
end