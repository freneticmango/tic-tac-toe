class Player

  attr_accessor :name, :token
  
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

