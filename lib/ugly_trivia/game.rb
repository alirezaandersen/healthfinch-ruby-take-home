require 'pry'

module UglyTrivia
  class Game

    attr_reader :questionaire

    def  initialize(questionaire = Questionaire.new)
      @players = []
      @questionaire = questionaire
      @current_player = 0
    end

    def is_playable?
      if how_many_players >= 2
        questionaire.set_questions
        return "Lets Play!"
      else
        return "Need more Players"
      end
    end

    def add(player_name)
      player = Player.new(player_name)
      @players.push(player)
      setup_game(player_name)
    end

    def roll(roll)
      output.who_has_the_dice(current_player)
      output.current_roll(roll)

      if current_player.in_penalty_box?
        if roll % 2 != 0
          current_player.getting_out_of_penalty_box
          roll_question(roll)
        else
          output.stuck_in_plenty_box(current_player)
          current_player.still_in_penalty_box?
        end
      else
        roll_question(roll)
      end
    end

    def roll_question(roll)
      current_player.move_location(roll)
      current_category
      questionaire.ask_question(current_player.location)
    end

    def was_correctly_answered
      if current_player.in_penalty_box?
        if current_player.still_in_penalty_box?
          output.correct_answer
          correct_answer_prize
        else
          next_player
          true
        end
      else
      correct_answer_prize
      end
    end

    def correct_answer_prize
      output.correct_answer
      current_player.bank_roll
      keep_playing = !current_player.winner?
      next_player
      keep_playing
    end

    def wrong_answer
      output.incorrect_answer
      current_player.go_in_penalty_box
      next_player

      return true
    end

    private

    def current_category
      category = questionaire.current_category(current_player.location)
      output.current_category(category)
    end

    def current_player
      @players[@current_player]
    end

    def next_player
      @current_player += 1
      @current_player = 0 if @current_player == how_many_players
      self
    end

    def how_many_players
      @players.length
    end

    def invalid_game?
      how_many_players.zero?
    end

    def output
      Communication.new()
    end

    def setup_game(player_name)
      current_player.bank
      current_player.location
      player.go_in_penalty_box if invalid_game?
      output.add_player(player_name)
      output.num_of_players(how_many_players)
    end
  end
end
