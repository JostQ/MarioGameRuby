def initialize_pyramide(floor = 10)

    i = 1
    empty = " "
    stair = "#"

    while i < floor do
        empty += " "
        i += 1
    end

    if @mario == 11
        puts " #{empty}   __"
        puts " #{empty}  |__|"
        puts " #{empty}  |"
        puts " #{empty}\b\\@/"
    else
        puts " #{empty} __"
        puts " #{empty}|__|"
        puts " #{empty}|"
    end

    while floor > 0 do
        if @mario == floor
            puts "#{empty}@#{stair}"
        else
            puts " #{empty}#{stair}"
        end
        empty = "#{empty}\b"
        stair = "#{stair}" + "#"
        floor -= 1      
    end
end

def game
    error = false

    @mario = 1

    initialize_pyramide

    while !error do

        while !error do

            puts "¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯"
            puts "Lancez le dé (press enter or \"quit\"):"
            print "> "
            confirm = gets.chomp

            if confirm == "quit"

                return "Merci d'avoir joué et aurevoir !"

            elsif confirm

                puts move
                
                initialize_pyramide

                if @mario == 11
                    return "Vous avez gagné !"
                end

                break
            else
                return "Error !"
            end

        end
        
    end
end

def move
    roll = rand (1..6)
    if roll == 1
        if @mario == 1
            return "Vous avez fait #{roll}, Mario est déjà au premier étage, il ne peut pas descendre plus bas..."
        else
            @mario -= 1
            return "Vous avez fait #{roll}, Mario est descendu d'un étage, il est à l'étage #{@mario}..."
        end
    elsif roll == 5 || roll == 6
        @mario += 1
        if @mario == 11
            return "Vous avez fait #{roll}, Mario est au dernier étage et a attrapé le drapeau !"
        end
        return "Vous avez fait #{roll}, Mario est monté d'un étage, il est à l'étage #{@mario} !"
    else
        return "Vous avez fait #{roll}, Mario n'a pas bougé."
    end
end

puts game