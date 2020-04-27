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

  def create_rock_question(index)
    "Rock Question #{index}"
  end

  def ask_question(current_places)
    puts @pop_questions.shift if current_category(current_places) == 'Pop'
    puts @science_questions.shift if current_category(current_places) == 'Science'
    puts @sports_questions.shift if current_category(current_places) == 'Sports'
    puts @rock_questions.shift if current_category(current_places) == 'Rock'
  end

  def current_category(current_places)
    return 'Pop' if current_places == 0
    return 'Pop' if current_places == 4
    return 'Pop' if current_places == 8
    return 'Science' if current_places == 1
    return 'Science' if current_places == 5
    return 'Science' if current_places == 9
    return 'Sports' if current_places == 2
    return 'Sports' if current_places == 6
    return 'Sports' if current_places == 10
    return 'Rock'
  end

end
