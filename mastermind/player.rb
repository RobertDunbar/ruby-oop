class Player
    include Interface

    attr_accessor :guess
    attr_reader :type, :code

    def initialize(type)
        @type = type
        @guess = []
        @code = Code.new(type)
    end
end