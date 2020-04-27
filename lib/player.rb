class Player

  attr_reader :name

  def initialize(player_name)
    # binding.pry
    @name = player_name
    @current_player = 0
    @places = 0 #current_position
    @bank = 0 #bankroll is purses
    @in_penalty_box = false
  end

  def in_penalty_box?
    @in_penalty_box
  end

  def go_in_penalty_box
    @in_penalty_box = true
  end


end
