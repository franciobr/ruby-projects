#Tic-tac-toe

# Author::    Francio Rodrigues  (mailto:learning-rubyrdoc@x.y)
# Copyright:: No Copytright
# License::   Distributes under the same terms as Ruby

#This class holds the board of the game. It is the front-end that interacts with the two players of tictactoe.

class Board

  #Draws empty game board
  def initialize

    @xo = ["_", "_", "_", "_", "_", "_", " ", " ", " "]
    @turn = 1
    self.draw_board
    self.turn_call
  end

  def draw_board
    board = "_#{@xo[0]}_|_#{@xo[1]}_|_#{@xo[2]}_ \n_#{@xo[3]}_|_#{@xo[4]}_|_#{@xo[5]}_\n #{@xo[6]} | #{@xo[7]} | #{@xo[8]} "
    puts(board)
  end

  #Updates the board positions to X and O`s
  def update_board(position, xo_char)

    @xo[position-1] = xo_char
    self.game_over?(xo_char)
    self.draw_board
    self.turn_call
  end

  def turn_call

    if @turn == 1
      @turn = 2
      self.player_turn("X")
    else
      @turn = 1
      self.player_turn("O")
    end
  end

  #Receives player1 X input to where draw X
  def player_turn(xo_char)
    print "Player #{xo_char} type 1-9: "
    position_played = gets.to_i

    self.valid_play?(position_played, xo_char)
    self.update_board(position_played,xo_char)
  end

  def valid_play?(position, xo_char)
    if @xo[position-1]=="X" or @xo[position-1]=="O"
      puts "Invalid play. Choose an empty board position."
      self.draw_board
      self.player_turn(xo_char)
    end
  end

  def game_over?(xo_char)
    # puts "entrei no game_over? com xo_char = #{xo_char}"
    # puts "e xo = #{@xo}"
    # should make loops for a more concise way of checking if the game is over....

    #row 1 check
    fill_board_checker = 0
    if @xo[0]==xo_char and @xo[0]==@xo[1] and @xo[0]==@xo[2]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #row 2 check
    elsif @xo[3]==xo_char and @xo[3]==@xo[4] and @xo[3]==@xo[5]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #row 3 check
    elsif @xo[6]==xo_char and @xo[6]==@xo[7] and @xo[6]==@xo[8]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #column 1 check
    elsif @xo[0]==xo_char and @xo[0]==@xo[3] and @xo[0]==@xo[6]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #column 2 check
    elsif @xo[1]==xo_char and @xo[1]==@xo[4] and @xo[1]==@xo[7]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #column 3 check
    elsif @xo[2]==xo_char and @xo[2]==@xo[5] and @xo[2]==@xo[8]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #diagonal 1 check
    elsif @xo[0]==xo_char and @xo[0]==@xo[4] and @xo[0]==@xo[8]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #diagonal 2 check
    elsif @xo[2]==xo_char and @xo[2]==@xo[4] and @xo[2]==@xo[6]
      puts "Game Over!!! Player #{xo_char} wins!"
      self.draw_board 
      exit

      #checks if the board is full
    elsif @xo.each do |position|
        if position == "X" or position == "O"
          fill_board_checker+=1
        end
      end
      if fill_board_checker==9
        puts "It`s a tie! Play again =D!"
        self.draw_board 
        exit
      end
    end
  end
end
