
#game class contains logic for getting input from the player, playing rounds, and 
class Game 

  def initialize(game_board, players)

    @game_board = game_board
    @players = players

  end

  #gets input from the player to select player token placement
  def get_player_choice(player)

    puts ""
    puts "#{player.name}, please input a board position."
    puts ""
    
    input = gets.chomp.to_i

    #if input is not an available position, continues to prompt for input
    until @game_board.board.include?(input)
      puts ""
      puts "#{player.name}, please input a valid board position."
      puts ""

      input = gets.chomp.to_i

    end

    #changes board position to player's token
    index = @game_board.board.find_index(input)
    @game_board.board[index] = player.token

  end

  #displays the board and gets player input for each player. loop breaks and winner is announced if a winner or tie is detected.
  def play_round
    @players.each do |player|
      @game_board.display_board

      get_player_choice(player)

      if @game_board.winner?(@players)

        @game_board.display_board
        puts ""
        puts "#{@game_board.get_winner(@players)} wins!"
        puts ""

        break
      end

      if @game_board.tie? 
        @game_board.display_board
        puts ""
        puts "It's a tie!"
        puts ""

        break
      end
    end
  end

  #plays rounds continuously until a winner or tie is detected
  def play_game

    until @game_board.winner?(@players) || @game_board.tie?
      play_round
    end

  end

end