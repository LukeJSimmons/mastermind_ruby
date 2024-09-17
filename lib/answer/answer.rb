class Answer
  attr_accessor :options, :answer

  def initialize(answer=self.generage_answer, options=["blue", "green", "yellow", "red", "purple", "orange"])
    @options = options
    @answer = answer
  end

  def generage_answer
    answer = []
    4.times do
      answer << options.sample
    end
    answer
  end

  def compare_guess(guess, computer=false)
    pegs = {}
    answer_colors = {}

    guess.each_with_index do |color, index|
      if answer[index] == color
        pegs["red peg"] ? pegs["red peg"] += 1 : pegs["red peg"] = 1

        if computer
          answer_colors[index] = "red"
        end
      elsif answer.include?(color)
        pegs["white peg"] ? pegs["white peg"] += 1 : pegs["white peg"] = 1

        if computer
          answer_colors[index] = "white"
        end
      end
    end

    if answer_colors.all? { |index, color| color == 'red' } && answer_colors.length == 4
      return 'Guess Correct! Computer Wins!'
    end

    if computer
      return {'pegs' => answer_colors, 'prev_guess' => guess}
    end

    if guess == @answer
      return "Guess Correct! You Win!"
    end
    
    pegs ? pegs : 'No Matching Colors'
  end
  
end