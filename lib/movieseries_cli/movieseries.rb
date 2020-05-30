class MovieSeries
    attr_accessor :title, :year, :plot, :rated, :released, :writer, :genre, :awards, :director, :actors 
    @@all = []

    def initialize(title, year, plot, released, writer, genre, director, actors)
        @title = title
        @year = year
        @plot = plot
        @released = released
        @writer= writer
        @genre = genre
        @director = director
        @actors = actors
        @@all << self
    end

    def self.all
        @@all
    end

end