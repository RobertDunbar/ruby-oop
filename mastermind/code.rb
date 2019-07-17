class Code
    include Interface

    attr_reader :code, :code_array

    def initialize(type)
        @code_array = ["y", "g", "b", "r", "p", "w"]
        @code = []
        @code = game_io("maker") if type == "maker"
        @code = game_io("breaker") if type == "breaker"
        6.times { @code << @code_array.sample } if type == "breaker"
    end
end
