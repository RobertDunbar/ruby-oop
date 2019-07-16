class Player
    include Interface

    attr_accessor :guess
    attr_reader :name, :code

    def initialize(type)
        @type = type
        @guess = []
        game_io("instruct-breaker") if type == "breaker"
        @code = Code.new(type)
    end
end