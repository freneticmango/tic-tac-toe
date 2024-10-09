require 'pry-byebug'

class Board

  WINNING_POSITIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
                      [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
                      [0, 4, 8], [2, 4, 6]] #Diagonal 

  attr_accessor :board

  #initializes an instance of board with positions marked for human readability
  def initialize(players)
    @players = players
    
    array = Array.new(9) 

    @board = array.each_with_index.map { |value, index| index + 1}
  end

  def get_winner
    WINNING_POSITIONS.any? do |combo|
      board_to_check = combo.map { |i| @board[i] }
      if board_to_check.all? { |position| position == @players[0].token }
        return @players[0].name
      elsif board_to_check.all? { |position| position == @players[1].token }
        return @players[1].name
      else
        false
      end
    end
  end


  #displays the board in 3x3 tic tac toe format
  def display_board
    puts ""
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts ""
  end
end
    
