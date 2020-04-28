require 'pry'

class Player

  attr_reader :name

  WINNER = 6
  LIMIT = 11
  EXCEED_LIMIT = 12

  def initialize(player_name)
    @name = player_name
    @current_place = 0
    @places = 0 #current_player_position
    # @bank = 0 #bankroll is purses
    @in_penalty_box = false
    @is_getting_out_of_penalty_box = false
  end

  def in_penalty_box?
    @in_penalty_box
  end

  def go_in_penalty_box
    @in_penalty_box = true
    output.going_in_plenty_box(name)
  end

  def still_in_penalty_box?
    output.stuck_in_plenty_box(name)
    @is_getting_out_of_penalty_box
  end

  def getting_out_of_penalty_box
    @is_getting_out_of_penalty_box = true
    output.out_of_penalty_box(name)
  end

  def bank_roll
    @places
  end


  private

  def output
    Communication.new()
  end

end
