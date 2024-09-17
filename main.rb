require './lib/answer/answer'
require './lib/guess_mode/guess_mode'
require './lib/answer_mode/answer_mode'

def mastermind
  puts "Would like to guess or create the answer and let the computer guess? Input guess or answer"
  mode = gets.chomp == 'guess' ? 'guess' : 'answer'

  if mode == 'guess'
    guess_mode
  elsif mode == 'answer'
    answer_mode
  else
    puts 'Invalid Input: Please Input Either guess or answer'
    mastermind
  end

end

mastermind