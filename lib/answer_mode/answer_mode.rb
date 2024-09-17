require_relative '../guesser_ai/guesser_ai'
require_relative '../answer/answer'

def answer_mode
  puts "Please Input Number of Guesses for the Computer"
  max_guesses = gets.chomp.to_i

  answer = Answer.new([])
  puts 'Please Input Answer:'
  puts 'Options are ' + answer.options.join(', ')
  answer.answer = gets.chomp.split

  puts 'Your Answer is ' + answer.answer.join(', ')
  puts "Let's see how the computer does"

  guesser = GuesserAI.new(answer.options)

  prev_results = {}
  prev_guess = []
  until guesser.current_guess > max_guesses
    prev_results = answer.compare_guess(guesser.guess(prev_results), true)
    
    if prev_results.instance_of?(String)
      puts prev_results
      puts "Number of Guesses: #{guesser.current_guess}"
      break
    end
  end
end