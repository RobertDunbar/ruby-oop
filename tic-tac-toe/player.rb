class Player
    include Interface

    attr_accessor :positions
    attr_reader :name, :char

    def initialize(name, char)
        @name = game_io("player", name + "?")
        @char = char
        @positions = []
    end
end