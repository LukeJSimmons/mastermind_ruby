class GuesserAI
  attr_accessor :current_guess

  def initialize(options)
    @options = options
    @current_guess = 0
  end

  def guess(prev_results)
    answer = Array.new(4, @options[@current_guess])
    
    prev_results['pegs'].each { |index, peg| answer[index] = prev_results['prev_guess'][index] if peg == "red"  } if prev_results['pegs']

    @current_guess += 1
    puts answer.join(', ').capitalize
    return answer
  end
end