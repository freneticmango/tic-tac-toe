class Game

  def initialize(players, game_board)
    @players = players
    @game_board = game_board
  end

  def get_player_choice(player)

    puts "Please input a board position."
    
    input = gets.chomp.to_i

    until @game_board.include?(input)
      puts "Please input a valid board position."
      input = gets.chomp.to_i
    end

    index = @game_board.find_index(input)
    @game_board[index] = player.token
  end

  def play_round(players)
    players.each do |player|
      get_player_choice(player)

    end
  end

end