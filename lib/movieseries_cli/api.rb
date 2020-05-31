class Api
    attr_accessor :show, :show_info
    @@all=[]

    SHOW_URL = 'http://www.omdbapi.com/?apikey='
    KEY = ENV['API_KEY']

    def self.get_info(show)
        response= RestClient.get(SHOW_URL+KEY+"&t=#{show}")
        data= JSON.parse(response.body)
        if data["Response"] == "False"
            Cli.error_message
        else
        title = data["Title"]
        year = data["Year"]
        plot = data["Plot"]
        released = data["Released"]
        writer = data["Writer"]
        genre = data["Genre"]
        director = data["Director"]
        actors = data["Actors"]
        MovieSeries.new(title, year, plot, released, writer, genre, director, actors)
        end
    end    
end