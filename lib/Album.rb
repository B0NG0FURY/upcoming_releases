class Album
    attr_accessor :name, :artist, :label, :lp, :cd, :mp3, :description

    @@all = []

    def initialize(album_hash)
        album_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self
    end

    def self.create_albums(album_array)
        album_array.each {|album| Album.new(album)}
    end

    def add_album_info(info_hash)
        info_hash.each {|key, value| self.send("#{key}=", value)}
    end
end