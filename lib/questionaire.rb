require 'pry'

class Questionaire

  def initialize
    @pop_questions = []
    @science_questions = []
    @sports_questions = []
    @rock_questions = []
  end

  def set_questions
    50.times do |i|
      @pop_questions.push "Pop Question #{i}"
      @science_questions.push "Science Question #{i}"
      @sports_questions.push "Sports Question #{i}"
      @rock_questions.push create_rock_question(i)
    end
  end

  def ask_question
    puts @pop_questions.shift if current_category == 'Pop'
    puts @science_questions.shift if current_category == 'Science'
    puts @sports_questions.shift if current_category == 'Sports'
    puts @rock_questions.shift if current_category == 'Rock'
  end

  def current_category
    return 'Pop' if @places[@current_player] == 0
    return 'Pop' if @places[@current_player] == 4
    return 'Pop' if @places[@current_player] == 8
    return 'Science' if @places[@current_player] == 1
    return 'Science' if @places[@current_player] == 5
    return 'Science' if @places[@current_player] == 9
    return 'Sports' if @places[@current_player] == 2
    return 'Sports' if @places[@current_player] == 6
    return 'Sports' if @places[@current_player] == 10
    return 'Rock'
  end
end
