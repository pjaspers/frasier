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
  end
end
