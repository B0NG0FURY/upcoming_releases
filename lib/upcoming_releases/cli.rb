class UpcomingReleases::CommandLineInterface
    ALBUM_URL = "https://midheaven.com"

    def run
        puts "********************"
        puts "Searching for all upcoming album releases...."
        puts "********************"
        get_albums
        list_albums
    end

    def list_albums
        puts " "
        input = ""
        until input == "exit"
            puts "To see upcoming releases in order of artist enter 'list artist'"
            puts "To see upcoming releases in order of record label enter 'list label'"
            puts "Or enter 'exit' to leave program"
            input = gets.strip
            if input == "list artist"
                artist_list
            elsif input == "list label"
                label_list
            elsif input == "exit"
                exit
            end
        end
    end

    def get_albums
        albums = UpcomingReleases::Scraper.scrape_release_page(ALBUM_URL + "/upcoming-releases")
        UpcomingReleases::Album.create_albums(albums)
    end

    def add_info
        UpcomingReleases::Album.all.each do |album|
            info = UpcomingReleases::Scraper.scrape_info_page(ALBUM_URL + album.info_url)
            album.add_album_info(info)
        end
    end

    def get_album_info(album)
        info = UpcomingReleases::Scraper.scrape_info_page(ALBUM_URL + album.info_url)
        album.add_album_info(info)
    end

    def artist_list
       list = UpcomingReleases::Album.all.sort_by {|album| album.artist}
       list.each_with_index do |album, i|
        puts "#{i + 1}. Artist: #{album.artist}   Album: #{album.name}   Label: #{album.label}"
       end
       album_choice(list)
    end

    def label_list
        list = UpcomingReleases::Album.all.sort_by {|album| album.label}
        list.each_with_index do |album, i|
         puts "#{i + 1}. Label: #{album.label}   Artist: #{album.artist}   Album: #{album.name}"
        end
        album_choice(list)
    end

     def album_choice(list)
        input = 0
        until input > 0 && input <= list.count
         puts "--------------------"
         puts "Enter number of album for more information"
         input = gets.strip.to_i
        end
        album = list[input - 1]
        if album.description == nil
            puts "Gathering info..."
            puts ""
            get_album_info(album)
        end
        print_info(album)
        decision_loop
     end

     def print_info(album)
        puts "--------------------"
        puts "#{album.artist} - #{album.name}"
        puts "                    "
        if album.lp != nil
         puts "LP: #{album.lp[:price]}, #{album.lp[:release_date]}"
        end
        if album.cd != nil
         puts "CD: #{album.cd[:price]}, #{album.cd[:release_date]}"
        end
        if album.mp3 != nil
         puts "MP3: #{album.mp3[:price]}, #{album.mp3[:release_date]}"
        end
        if album.seven_inch != nil
            puts "7 inch: #{album.seven_inch[:price]}, #{album.seven_inch[:release_date]}"
        end
         puts " "
         puts "#{album.description}"
         puts "--------------------"
     end

     def decision_loop
        input = ""
        until input == "exit"
            puts "Enter 'back' to view more upcoming album releases"
            puts "Or enter 'exit' to leave program"
            input = gets.strip
            if input == "back"
                list_albums
            end
            if input == "exit"
                exit
            end
        end
     end
end