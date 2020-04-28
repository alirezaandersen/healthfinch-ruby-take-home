require 'pry'

class Communication

  def initialize
  end

  def add_player(player_name)
    puts "#{player_name} was added"
  end

  def num_of_players(how_many_players)
    puts "They are player number #{how_many_players}"
  end

  def who_has_the_dice(current_player)
    puts "#{current_player.name} is the current player"
  end

  def current_roll(roll)
    puts "They have rolled a #{roll}"
  end

  def out_of_penalty_box(current_player)
    puts "#{current_player} is getting out of the penalty box"
  end

  def current_player_new_location(current_player, current_player_position)
    puts "#{current_player.name}'s new location is #{current_player_position}"
  end

  def current_category(current_category)
    puts "The category is #{current_category}"
  end

  def stuck_in_plenty_box(current_player)
    puts "#{current_player} is not getting out of the penalty box"
  end

  def going_in_plenty_box(current_player)
    puts "#{current_player} was sent to the penalty box"
  end

  def correct_answer
    puts 'Answer was correct!!!!'
  end

  def incorrect_answer
    puts 'Question was incorrectly answered'
  end

  def bank_roll(current_player, bank)
    puts "#{current_player.name} now has #{bank} Gold Coins."
  end
end
