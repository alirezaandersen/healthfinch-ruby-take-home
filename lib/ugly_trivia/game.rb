require 'pry'
# require_relative '../questionaire'

module UglyTrivia
  class Game

    attr_reader :questionaire

    def  initialize(questionaire = Questionaire.new)
      @players = []
      @places = Array.new(6, 0)
      @purses = Array.new(6, 0)
      @in_penalty_box = Array.new(6, nil)
      @questionaire = questionaire
      @current_player = 0
      @is_getting_out_of_penalty_box = false
    end

    def is_playable?
      if how_many_players >= 2
        questionaire.set_questions
        return "Lets Play!"
      else
        return "Need more Players"
      end
    end

    def output
      Communication.new()
    end

    def add(player_name)
      @players.push player_name
      @places[how_many_players] = 0
      @purses[how_many_players] = 0
      @in_penalty_box[how_many_players] = false

      output.add_player(player_name)
      output.num_of_players(how_many_players)

      true
    end

    def how_many_players
      @players.length
    end

    def current_player
      @players[@current_player]
    end

    def next_player
      @current_player += 1
      @current_player = 0 if @current_player == how_many_players
      self
    end

    def current_position(roll)
      @places[@current_player] = @places[@current_player] + roll
      @places[@current_player] = @places[@current_player] - 12 if @places[@current_player] > 11
    end

    def current_player_position
      @places[@current_player]
    end

    def roll(roll)
      output.who_has_the_dice(current_player)
      output.current_roll(roll)

      if @in_penalty_box[@current_player]
        if roll % 2 != 0
          @is_getting_out_of_penalty_box = true

          output.out_of_penalty_box(current_player)

          current_position(roll)

          output.current_player_new_location(current_player, current_player_position)

          output.current_category(current_category)

          questionaire.ask_question(current_player_position)
        else
          output.stuck_in_plenty_box(current_player)
          @is_getting_out_of_penalty_box = false
        end

      else

        current_position(roll)
        output.current_player_new_location(current_player, current_player_position)
        output.current_category(current_category)
        questionaire.ask_question(current_player_position)
      end
    end

    def current_category
      questionaire.current_category(current_player_position)
    end

    public

    def was_correctly_answered
      if @in_penalty_box[@current_player]
        if @is_getting_out_of_penalty_box
          output.correct_answer
          @purses[@current_player] += 1
          puts "#{current_player} now has #{@purses[@current_player]} Gold Coins."
          winner = did_player_win()
          next_player
          winner
        else
          next_player
          true
        end

      else

        output.correct_answer
        @purses[@current_player] += 1
        puts "#{current_player} now has #{@purses[@current_player]} Gold Coins."

        winner = did_player_win
        next_player
        return winner
      end
    end

    def wrong_answer
      output.incorrect_answer
      output.going_in_plenty_box(current_player)
      @in_penalty_box[@current_player] = true
      next_player

      return true
    end

    private

    def did_player_win
      !(@purses[@current_player] == 6)
    end
  end
end
