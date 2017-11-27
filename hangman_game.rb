#Hangman game implemented with a Hangman class and a Hangman_player class.
#Possible improvements: save state of the game, check for valid user inputs

class Hangman

  #defines state varibles
  attr_reader :word, :board_array, :player
  def initialize
    @word = self.choose_word
    @board_array = Array.new(@word.length,"_")
    @player = Hangman_player.new(self)
    self.game_loop
  end

  #Loop that controls the flow of the game.
  #1 - prints the state
  #2 - asks for guess from Player
  #3 - evaluates guess
  #4 - outputs the guess
  #5 - checks for game ending conditions and loops back

  def game_loop
    loop do
      self.draw_board
      guess = @player.make_a_guess

      if @word.include?(guess)
        puts "Good guess!"
        self.update_board(guess)
      else
        puts "Wrong guess!"
        @player.loose_life
      end

      if @player.life==0
        puts "You got hanged! The right word was #{@word}"
        exit
      end

      if @board_array.join==@word
        puts "You won! Congratulations!"
        self.draw_board
        exit
      end
    end
  end

  def draw_board
    puts @board_array.join(" ")
  end

  def update_board(guess)

    #looks for all the ocurrences of the letter in @word and saves their indexes in an array.
    ocurrences_index = (0 ... @word.length).find_all { |i| @word[i,1] == guess }
    ocurrences_index.each do |index|
      @board_array[index] = guess
    end
  end

  # def valid_guess?(guess)

  # end

  #Chooses a random word with 5>length>12 from hangman_dictionary.txt
  def choose_word

    valid_words = []
    File.open("hangman_dictionary.txt","r") do |file|
      file.each_line do |word|

        strip_word = word.chomp.strip.downcase
        if strip_word.length >5 and strip_word.length<12
          valid_words << strip_word
        end
      end
    end

    word = valid_words.sample
    return word
  end

end