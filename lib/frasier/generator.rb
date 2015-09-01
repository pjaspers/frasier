module Frasier
  class Generator

    def initialize(word_list, options = {})
      options ||= {}
      @number_of_words  = options.fetch(:number_of_words, 5)
      @max_chars  = options.fetch(:max_chars, nil)
      @no_whitespace = options.fetch(:no_whitespace, false)
      @word_list = word_list
    end

    # A roll of the dice.
    def roll
      SecureRandom.random_number(5) + 1
    end

    # Simulate 5 dice rolls and get the word from our list
    def random_word
      word = @word_list[[roll, roll, roll, roll, roll].join("")]
      return word if word
      random_word
    end

    def non_whitespace_chars
      %w(~ ! @ # $ % ^ & * ( ) _ + = - ).freeze
    end

    def random_non_whitespace_char
      non_whitespace_chars.sample
    end

    def sum_string_length(array)
      (array || []).inject("", :+).length
    end

    def random_words_upto_chars
      words = []
      while sum_string_length(words) < @max_chars
        words << random_word
      end
      too_much = sum_string_length(words) + (words.length - 1) - @max_chars
      words.pop if too_much > 0
      words
    end

    def random_words_upto_number_of_words
      (0...@number_of_words).collect do |i|
        random_word
      end
    end

    def passphrase
      return @passphrase if @passphrase

      if @max_chars
        @words = random_words_upto_chars
      else
        @words = random_words_upto_number_of_words
      end

      if @no_whitespace
        @passphrase = @words.map {|w| w.dup << random_non_whitespace_char}.join("").chop
      else
        @passphrase = @words.join(" ")
      end
    end

    # Total number of combinations possible, represent the total entropy
    def entropy
      _ = passphrase
      if @no_whitespace
        (@word_list.length ** @words.length) * ((@words.length - 1) * non_whitespace_chars.length)
      else
        @word_list.length ** @words.length
      end
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
