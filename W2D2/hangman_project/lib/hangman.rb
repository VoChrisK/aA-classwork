class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |let, i|
      indices << i if char == let
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    attempted = self.already_attempted?(char)
    if attempted
      p "that has already been attempted"
      return false
    end

    indices = self.get_matching_indices(char)
    if indices == []
       @remaining_incorrect_guesses -= 1
       @attempted_chars << char
       return true
    end

    self.fill_indices(char, indices)
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp

    self.try_guess(guess)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end

end
