require "./include.rb"
require "./player.rb"
require "./game.rb"
require "./board.rb"


RSpec.describe Player do
    player = Player.new("Player One", "X")

    describe "#initialize" do
        it "check name" do
            expect(player.name).to eql("Rob")
        end
        it "check char" do
            expect(player.char).to eql("X")
        end
        it "check positions" do
            expect(player.positions).to eql([])
        end
    end
end

RSpec.describe Board do
    board = Board.new()

    describe "#initialize" do
        it "player cells" do
            expect(board.cells).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
        end
        it "check winning lines" do
            expect(board.winning_lines).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]])
        end
    end
end

RSpec.describe Game do
    player1 = Player.new("Player One", "X")
    player2 = Player.new("Player Two", "O")
    board = Board.new
    game = Game.new(player1, player2, board)

    describe "#end_of_game?" do
        it "start of game no winner or loser player1" do
            expect(game.end_of_game?(player1)).to eql(false)
        end
        it "start of game no winner or loser player2" do
            expect(game.end_of_game?(player2)).to eql(false)
        end
        it "start of game no winner or loser player2" do
            expect(game.end_of_game?(player2)).to eql(false)
        end
        it "full board and no winner is loser" do
            board.cells = %w[X X O O O X X O O]
            expect(game.end_of_game?(player2)).to eql("full")
        end
        it "player 1 is a winner" do
            board.cells = [1,2,3,4,5,6,7,8,9]
            player1.positions = [1,2,3]
            expect(game.end_of_game?(player1)).to eql("winner")
        end
        it "player 2 is a winner" do
            board.cells = [1,2,3,4,5,6,7,8,9]
            player2.positions = [1,5,9]
            expect(game.end_of_game?(player2)).to eql("winner")
        end
        it "player is a winner with more than 3 selections" do
            board.cells = [1,2,3,4,5,6,7,8,9]
            player2.positions = [1,3,5,9]
            expect(game.end_of_game?(player2)).to eql("winner")
        end
    end
end

RSpec.describe Interface do
    include Interface

    describe "#check_valid_num" do
        it "checks for valid board numerical input position false" do
            expect(check_valid_num?("f")).to eql(nil)
        end
        it "checks for valid board numerical input position true" do
            expect(check_valid_num?("5")).to be_truthy
        end
    end
end
