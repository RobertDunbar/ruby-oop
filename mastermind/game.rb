class Game
    include Interface

    def initialize(player)
        @player = player
        @times = 0
    end

    def play
        loop do
            player_turn()
            @result = end_of_game?()
            break if @result
        end
        game_io(@result, @times.to_s) if @result == "lose"
        game_io(@result, @player.guess) if @result == "winner"
        replay = game_io("again")
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

    def check_result
        player_array = @player.guess.split("")
        return true if player_array == @player.code.code
        for i in 0..5
            if player_array[i] == @player.code.code[i]
                print player_array[i].blue
            elsif @player.code.code.include? (player_array[i])
                print player_array[i]
            else
                print player_array[i].red
            end
        end
        puts "\n"
        return false
    end
end
