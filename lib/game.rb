class Game

  def initialize(players, game_board)
    @players = players
    @game_board = game_board
  end

  def get_player_choice(player)

    puts "Please input a board position."
    
    input = gets.chomp.to_i

    until @game_board.board.include?(input)
      puts "Please input a valid board position."
      input = gets.chomp.to_i
    end

    index = @game_board.board.find_index(input)
    @game_board.board[index] = player.token
  end

  def play_round

    @players.each do |player|
      @game_board.display_board

      get_player_choice(player)

      if @game_board.get_winner
        puts "#{@game_board.get_winner} wins!"
        break
      end
    end
  end

  def play_game
    until @game_board.get_winner
      play_round
    end
  end

  

end