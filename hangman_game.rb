class Hangman

  def initialize(word)
    @word = word
    self.draw
  end

  def game_loop
  end

  def draw
    puts "_ _ _ _ _ #{@word}"
  end

  def helper_functions
  end

end
