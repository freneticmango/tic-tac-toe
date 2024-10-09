require 'pry-byebug'

#player class holds player name and token. class instances build an array of players for use by other classes.
class Player

  attr_accessor :name, :token, :players
  
  @@players = []

  def self.players
    @@players
  end

  def initialize(name, token)
    @name = name
    @token = token
    @@players << self
  end


end

