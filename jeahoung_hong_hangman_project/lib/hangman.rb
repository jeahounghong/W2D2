class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    return DICTIONARY.sample
  end
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = []
    @secret_word.length.times do
      @guess_word << "_"
    end

    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(c)
    return @attempted_chars.include?(c) ? true : false
  end

  def get_matching_indices(c)
    arr = []
    @secret_word.each_char.with_index do |char,i|
      arr << i if char == c
    end
    arr
  end

  def fill_indices(c, arr)
    arr.each do |el|
      @guess_word[el] = c
    end
  end

  def try_guess(c)
    if already_attempted?(c)
      p "that has already been attempted"
      false
    else
      @attempted_chars << c
      @remaining_incorrect_guesses -= 1 if !@secret_word.include?(c)
      arr = get_matching_indices(c)
      fill_indices(c, arr)
      true
    end

  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    return try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
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
    if win? or lose?
      p @secret_word
      return true
    else
      return false
    end


  end

end
