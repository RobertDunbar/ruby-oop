class String
    def red; "\e[31m#{self}\e[0m" end
    def blue; "\e[34m#{self}\e[0m" end
end

require "./include.rb"
require "./player.rb"
require "./game.rb"
require "./code.rb"

include Interface

loop do
    type = game_io("welcome")
    player = Player.new("maker") if type == "1"
    player = Player.new("breaker") if type == "2"
    game = Game.new(player)

    if !game.play
        game_io("finish")
        break
    end
end