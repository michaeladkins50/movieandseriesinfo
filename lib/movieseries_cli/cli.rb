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
        MovieSeries.all.each do |p|
            case select
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
                MovieSeries.all.clear
                Cli.new.run            
            when 6
                exit_message
            end
        end
        main
    end
    
    def welcome
        puts "Welcome to Movie and Series Info!"
        puts "Please enter a Movie Title or Television Series Title to get started:"
    end
    
    def self.error_message
        puts "We seem to have encountered a problem."
        puts "Please check spelling or try again."
        Cli.new.run
    end
    
    def exit_message
        puts "Thank You for visiting Movie And Series Info"
        puts "Please come again."
        exit
    end
    
    def print_error
        puts "Invalid selection, please try again."
        sleep(1)
    end

    def synopsis
        show = gets.chomp 
        Api.get_info(show)
    end

    def show_selection_info
        MovieSeries.all.each do|p|
            puts ""
            puts "#{p.title} - #{p.year}"
            puts "#{p.plot}"
            puts ""
        end
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