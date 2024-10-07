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

  def winner?(player)
    WINNING_POSITIONS.any? do |combo|
      board_to_check = combo.map { |i| @board[i] }
      board_to_check.all?(player.token)
    end
  end


  #displays the board in 3x3 tic tac toe format
  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
end
    
