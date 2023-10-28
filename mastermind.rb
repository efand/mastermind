# Define available colors as numbers
colors = (1..6).to_a

# Randomly generate the secret code
secret_code = 4.times.map { colors.sample }

def provide_feedback(guess, secret_code)
  correct_colors = 0
  correct_positions = 0

  guess.each_with_index do |color, index|
    if secret_code[index] == color
      correct_positions += 1
    elsif secret_code.include?(color)
      correct_colors += 1
    end
  end

  feedback = '+' * correct_positions + '-' * correct_colors
end

# Player's turn
12.times do
  puts "Enter your guess (e.g., 1234):"
  guess = gets.chomp.chars.map(&:to_i)

  feedback = provide_feedback(guess, secret_code)
  puts "Feedback: #{feedback}"

  if feedback == '++++'
    puts "Congratulations! You've guessed the secret code!"
    break
  end
end

puts "Game over. The secret code was #{secret_code.join}."
