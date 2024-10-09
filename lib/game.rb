require 'pry-byebug'

#game class contains logic for getting input from the player, playing rounds, and 
class Game 

  def initialize(game_board, players)
    @game_board = game_board
    @players = players
  end

  #gets input from the player to select player token placement
  def get_player_choice(player)

    puts "#{player.name}, please input a board position."
    
    input = gets.chomp.to_i

    until @game_board.board.include?(input)
      puts "#{player.name}, please input a valid board position."
      input = gets.chomp.to_i
    end

    index = @game_board.board.find_index(input)
    @game_board.board[index] = player.token
  end

  #displays the board and gets player input for each player. loop breaks and winner is announced if a winner is detected.
  def play_round
    @players.each do |player|
      @game_board.display_board

      get_player_choice(player)

      if @game_board.winner?(@players)
        puts "#{@game_board.get_winner(@players)} wins!"
        break
      end
    end
  end

  #plays rounds continuously until a winner is detected
  def play_game
    until @game_board.winner?(@players)
      play_round
    end
  end

  

end