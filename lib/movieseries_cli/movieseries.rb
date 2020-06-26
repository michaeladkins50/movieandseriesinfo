class MovieSeries
    attr_accessor :title, :year, :plot, :rated, :released, :writer, :genre, :awards, :director, :actors, :movie
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

    def self.find_or_create_by(show)
        self.all.find {|movie| movie.title == show} || Api.get_info(show)
    end
end