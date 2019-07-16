module Interface

    def game_io(message, add_text="")
        messages = {
            "welcome" => "Welcome to Mastermind. Would you like to be a codemaker (input 1) or codebraker (input 2)?",
            "instruct-breaker" => "Correct guesses in the correct position will be shown in #{"blue".blue}."\
                                 "\nCorrect guesses in the incorrect position will be shown in white."\
                                 "\nIncorrect guesses in any position will be shown in #{"red".red}.",
            "maker" => "Please enter your own 6 letter code using the following letters: (y)ellow, (g)reen, (b)lue, (r)ed, (p)ink, (w)hite :",
            "turn" => "Please make a guess at the 6 letter code, (y)ellow, (g)reen, (b)lue, (r)ed, (p)ink, (w)hite - guess No.",
            "winner" => "We have a winner! Congratulations. You guessed the correct code, which was :",
            "incorrect" => "Please enter only a 6 letter combination of y, g, b, r, p or w :",
            "end" => "Please enter Y or N.",
            "finish" => "Thank you for playing. Have a nice day!",
            "lose" => "You lose! Guesses = ",
            "again" => "Would you like to play again (Y/N)?"
        }

        puts add_text == "" ? messages[message] :  "#{messages[message]} #{add_text}"
        case message
        when "welcome"
            choice = 0
            loop do
                choice = gets.chomp
                break if choice == "1" || choice == "2"
            end
            return choice
        when "maker"
            code = ""
            loop do
                code = gets.chomp
                break if true
            end
            return choice
        when "winner"
            return true
        when "turn"
            selection = ""
            loop do
                selection = gets.chomp
                break if (/[^ygbrpw]/.match (selection)).nil? && selection != "" && selection.length == 6
                game_io("incorrect")
            end
            return selection
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

end