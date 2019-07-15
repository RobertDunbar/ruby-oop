class Game
    include Interface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @current_player = @player1
    end

    def play
        loop do
            player_turn(@current_player)
            @result =  end_of_game?(@current_player)
            break if @result
            player_switch(@current_player)
        end
        game_io("full") if @result == "full"
        game_io("winner", @current_player.name) if @result == "winner"
        replay = game_io("again")
    end

    def end_of_game?(player)
        result = false
        result = "winner" if @board.winning_lines.any? { |line| line & player.positions == line }
        result = "full" if !@board.cells.any?(1..9)
        return result
    end

    def player_turn(player)
        loop do
            @player_choice = game_io("turn", player.name + "?")
            break if @board.cells[@player_choice - 1] != "X" && @board.cells[@player_choice - 1] != "O"
        end
        player.positions << @player_choice
        @board.cells[@player_choice - 1] = player.char
        @board.show_board(@board.cells)
    end

    def player_switch(player)
        player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
end
