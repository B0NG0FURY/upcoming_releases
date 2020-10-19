class Album
    attr_accessor :name, :artist, :label, :lp, :cd, :mp3, :description

    @@all = []

    def initialize(album_hash)
        album_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self
    end
end