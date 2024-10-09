require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

require 'pry-byebug'

x_player = Player.new("X Player", "X")
o_player = Player.new("O Player", "O")

player_list = Player.players

board = Board.new

game = Game.new(board, player_list)

game.play_game
