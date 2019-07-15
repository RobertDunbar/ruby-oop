module Interface

    def game_io(message, add_text="")
        messages = {
            "welcome" => "Welcome to Tic-Tac-Toe.",
            "player" => "What is the name of",
            "turn" => "Please select an available grid number",
            "winner" => "We have a winner! Congratulations",
            "number" => "Please enter a valid number.",
            "end" => "Please enter Y or N.",
            "finish" => "Thank you for playing. Have a nice day!",
            "full" => "The board is full! No winner.",
            "again" => "Would you like to play again (Y/N)?"
        }

        puts add_text == "" ? messages[message] :  "#{messages[message]} #{add_text}"
        case message
        when "player"
            return gets.chomp
        when "turn"
            selection = ""
            loop do
                selection = gets.chomp
                break if check_valid_num? (selection)
                game_io("number")
            end
            return selection.to_i
        when "again"
            selection = ""
            loop do
                selection = gets.chomp.upcase
                break if selection == "Y" || selection == "N"
                game_io("end")
            end
            return selection == "Y"
        else
            return false
        end
    end

    def check_valid_num? (input)
        return /[1-9]/.match (input)
    end

end