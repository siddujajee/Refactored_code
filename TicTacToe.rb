require "Players"
require "Board"

class TicTacToe
    attr_reader :players, :board,:current_player
    def initialize
        @board=Board.new
        @players=[]
    end
    def start
        if players.length!=2
            raise StandardError "two players are required for this game"
        end
        @current_player=players.first
        while !(win || board.draw) do
        render
        askposition
        switchplyer
        end
        if (winner = win)
            board.render
            puts "#{winner.name} you won"
        else
            puts "it's a draw"
        end
    end

    def render
        board.render
    end

    def win
        board.win
    end

    def switchplyer
       @current_player=(current_player==players.first)? players.last : players.first 
    end
    def askposition
        puts "#{current_player.name} choose your spot between 1-9"
        location = gets.chomp.to_i
        if (1..9).include?(location)
            if board.avaiable?(location)
                board.set(location, current_player)
            else
                puts "This spot has already taken"
                askposition
            end
        else
            puts "enter number between 1 to 9"
            askposition
        end
    end

   




    def add_players
        mark= players.empty? ? "X": "O"
        puts "enter player name:"
        name=gets.chomp
        players<<Player.new(name,mark)
    end
end