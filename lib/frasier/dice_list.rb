require 'stringio'

module Frasier

  class DiceList

    def initialize(io)
      if io.respond_to? :each_line
        @io = io
      else
        raise ArgumentError, "#{io} does not respond to `each_line`"
      end
    end

    # [Full list of requirements](http://world.std.com/%7Ereinhold/dicewarekit.html)
    #
    # Not following all the rules since most of the books don't seem to have
    # enough unique words to make a sizeable list. We'd need at least 7776 words,
    # but since you can use multiple sources that's not a hard rule.
    #
    def valid_words
      return @valid_words if @valid_words && @valid_words.length > 0

      @valid_words = Set.new
      @io.each_line do |l|
        # Funny story, in place methods are faster.
        l.gsub!(/[^[:alnum:]^[:blank:]]/, "")
        l.downcase!
        l.strip!
        # Only 'short' words
        l.split(" ").reject{|w| w.length < 3 || w.length > 10}.each do |w|
          @valid_words.add(w)
        end
      end
      @valid_words
    end

    def word_list
      return @word_list if @word_list

      # The coolest line in this whole source.
      #
      # Get all permuations with `1,2,3,4,5,6` (e.g. from '11111' to '66666')
      # only take as many as we need.
      indexes = (1..6).to_a.repeated_permutation(5).map(&:join).first(valid_words.length)

      # Zip the permutations with the words
      # So this creates a hash like:
      #
      #      {'11111': 'first',
      #       ...
      #       '66665': 'another',
      #       '66666': 'last'}

      @word_list = Hash[indexes.zip(valid_words)]
      @word_list
    end
  end
end
