class Cli
    # attr_accessor :show

    def run
        welcome

        synopsis
        
        main        
    end
    
    def main
        
        show_selection_info
    
        options
    
        select = valid_select?(option_select)

        second_options(select)
    end

    def second_options(select)
        p = @movie
            case var = select
            when 1
                puts ""
                puts "Directed by: #{p.director}"
                sleep(1)
            when 2
                puts ""
                puts "Written by: #{p.writer}"
                sleep(1)
            when 3
                puts ""
                puts "Genre: #{p.genre}"
                sleep (1)
            when 4
                puts ""
                puts "Actors: #{p.actors}"
                sleep(1)
            when 5
                @movie = nil
                run       
            when 6
                exit_message
            end
    
        main unless var == 6 || var == 5

    end
    
    def welcome
        puts "Welcome to Movie and Series Info!"
        puts "Please enter a Movie Title or Television Series Title to get started:"
    end
    
    def self.error_message
        puts "We seem to have encountered a problem."
        puts "Please check spelling or try again."
        run
    end
    
    def exit_message
        puts "Thank You for visiting Movie And Series Info"
        puts "Please come again."
    end
    
    def print_error
        puts "Invalid selection, please try again."
        sleep(1)
    end

    def synopsis
        show = gets.chomp 
           @movie = MovieSeries.find_or_create_by(show)
    end

    def show_selection_info
        p = @movie
            puts ""
            puts "#{p.title} - #{p.year}"
            puts "#{p.plot}"
            puts ""

    end

    def options
        sleep(1)
        puts "Learn more about this movie."
        puts "1. Director"
        puts "2. Writer"
        puts "3. Genre"
        puts "4. Actors"
        puts "5. Select New Movie or Television Series"
        puts "6. Exit Program"
        puts ""
        puts "Enter a number to select:"
    end

    def option_select
        gets.chomp
    end

    def valid_select?(select)
        select = select.to_i
        if select < 1 || select > 6
            print_error
            main
        end
        select
    end
end