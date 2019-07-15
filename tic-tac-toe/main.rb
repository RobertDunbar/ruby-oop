require "./include.rb"
require "./player.rb"
require "./game.rb"
require "./board.rb"

include Interface

loop do
    game_io("welcome")
    player1 = Player.new("Player One", "X")
    player2 = Player.new("Player Two", "O")
    board = Board.new
    game = Game.new(player1, player2, board)

    if !game.play
        game_io("finish")
        break
    end
end