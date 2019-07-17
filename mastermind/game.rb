class Game
    include Interface

    def initialize(player)
        @player = player
        @times = 0
        @ai_guess = %w[x x x x x x]
    end

    def play
        play_breaker() if @player.type == "breaker"
        play_maker() if @player.type == "maker"
        replay = game_io("again")
    end

    def play_breaker
        loop do
            player_turn()
            @result = end_of_game?()
            break if @result
        end
        game_io(@result, @times.to_s) if @result == "lose"
        game_io(@result, @player.guess.join()) if @result == "winner"
    end

    def play_maker
        loop do
            computer_turn()
            @result = end_of_game?()
            break if @result
        end
        game_io(@result, @times.to_s) if @result == "lose"
        game_io(@result, @player.guess.join()) if @result == "winner"
    end

    def end_of_game?()
        result = false
        result = "winner" if check_result()
        result = "lose" if @times >= 12
        return result
    end

    def player_turn()
        @times += 1
        @player.guess = game_io("turn", @times.to_s + " :")
    end

    def computer_turn()
        @times += 1
        game_io("computer", @times.to_s + " :")
        new_guess = @player.code.code_array[@times-1]
        @ai_guess.each_with_index { |char, index|
            @player.guess[index] = char if char != "x"
            @player.guess[index] = new_guess if char == "x"
        }
        sleep (2)
    end

    def check_result
        return true if @player.guess == @player.code.code
        for i in 0..5
            if @player.guess[i] == @player.code.code[i]
                print @player.guess[i].blue
                @ai_guess[i] = @player.guess[i]
            elsif @player.code.code.include? (@player.guess[i])
                print @player.guess[i]
            else
                print @player.guess[i].red
            end
        end
        puts "\n"
        return false
    end
end
