def guess_mode
  puts "Please Input Number of Guesses"
  max_guesses = gets.chomp.to_i
  answer = Answer.new

  loop do
    #Player Guess
    puts "\nOptions: #{answer.options.join(' ')}"
    puts "Guesses Left: #{max_guesses}"
    puts "\nInput Guess: color color color color"
    guess = gets.chomp.split
    
    #Handle Force Exit and Invalid Input
    break if guess == ['exit']

    if guess.any? { |color| !answer.options.include?(color)}
      puts "\nInvalid Input: Please Input from Options Listed Above"
      next
    end

    #Check for Win
    puts "\n" + answer.compare_guess(guess) + "\n"
    break if answer.compare_guess(guess).instance_of?(String)

    #Check for Loss
    max_guesses -= 1
    if max_guesses == 0
      puts "You Ran Out of Guesses! Better Luck Next Time"
      puts 'Answer: ' + answer.answer.join(' ')
      break
    end

  end
end