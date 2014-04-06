module Frasier
  class Generator

    def initialize(word_list, number_of_words = 5)
      @number_of_words = number_of_words
      @word_list = word_list
    end

    # A roll of the dice.
    def roll
      rand(5) + 1
    end

    # Simulate 5 dice rolls and get the word from our list
    def random_word
      word = @word_list[[roll, roll, roll, roll, roll].join("")]
      return word if word
      random_word
    end

    def passphrase
      (0...@number_of_words).map do |i|
        random_word
      end.join(" ")
    end

    # Total number of combinations possible, represent the total entropy
    def entropy
      @word_list.length ** @number_of_words
    end

    # Entropy = 2^n
    def bits_of_entropy
      Math.log(entropy, 2).round(2)
    end

    # Passphrase is probably guessed in 2^n-1
    #
    # Returns the seconds it takes to guess the passphrase
    def duration_to_guess(number_of_guesses_per_second = 10000)
      entropy/2.0/number_of_guesses_per_second.to_f
    end
  end
end
