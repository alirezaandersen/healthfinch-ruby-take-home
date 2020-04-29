require 'pry'

class Player

  attr_reader :name

  WINNER = 6
  LIMIT = 11
  EXCEED_LIMIT = 12

  def initialize(player_name)
    @name = player_name
    @places = 0
    @bank = 0
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
    @is_getting_out_of_penalty_box
  end

  def getting_out_of_penalty_box
    @is_getting_out_of_penalty_box = true
    output.out_of_penalty_box(name)
  end

  def bank
    @bank
  end

  def bank_roll
    @bank += 1
    output.bank_roll(name, bank)
  end

  def winner?
    @bank == WINNER
  end

  def location
    @places
  end

  def move_location(roll)
    @places += roll
    @places -= EXCEED_LIMIT if @places > LIMIT
    output.current_player_new_location(name, location)
    @places
  end

  private

  def output
    Communication.new()
  end

end
