class Questionaire

  POP = [0, 4, 8].freeze
  SCIENCE = [1, 5, 9].freeze
  SPORTS = [2, 6, 10].freeze

  CATEGORIES ={
    pop: POP,
    science: SCIENCE,
    sports: SPORTS
  }
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
      @rock_questions.push "Rock Question #{i}"
    end
  end

  def ask_question(selection)
    puts @pop_questions.shift if POP.include?(selection)
    puts @science_questions.shift if SCIENCE.include?(selection)
    puts @sports_questions.shift if SPORTS.include?(selection)
    puts @rock_questions.shift unless CATEGORIES.values.flatten.include?(selection)
  end

  def current_category(selection)
    CATEGORIES.each do |k, v|
      if v.include?(selection)
        return k.to_s.capitalize
      else
        return "Rock"
      end
    end
  end

end
