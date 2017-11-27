class Hangman_player

  attr_reader :life, :guesses_made, :game
  def initialize(game)
    @life = 6 #head, body, 2 arms, 2 legs.
    @guesses_made = Array.new
    @game = game
  end

  def make_a_guess
    print "Guess a letter. You have #{@life} guesses left. Guesses made: #{guesses_made.join(",")} \n"
    guess = gets.chomp


    self.update_guesses(guess)
    return guess
  end

  def update_guesses(guess)
    @guesses_made << guess 
  end

  def loose_life
    @life -= 1
  end

end