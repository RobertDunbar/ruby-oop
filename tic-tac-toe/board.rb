class Board

    attr_accessor :cells
    attr_reader :winning_lines

    def initialize
        @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        show_board(cells)
    end

    def show_board(cells)
        puts "\t  #{cells[0]} | #{cells[1]} | #{cells[2]}"
        puts "\t ---+---+---"
        puts "\t  #{cells[3]} | #{cells[4]} | #{cells[5]}"
        puts "\t ---+---+---"
        puts "\t  #{cells[6]} | #{cells[7]} | #{cells[8]}\n\n"
    end

end
