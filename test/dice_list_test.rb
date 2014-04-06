# coding: utf-8
require "helper"

describe DiceList do

  describe "creating the list of words" do
    it "removes all punctuation" do
      d = DiceList.new(StringIO.new(".:kdl My Man Jéëves!"))
      refute_match /\p{Punct}/, d.valid_words.to_a.join(" ")
    end

    it "doesn't remove alphanumeric chars" do
      d = DiceList.new(StringIO.new("OOO HAI 01234"))
      assert_equal "ooo hai 01234", d.valid_words.to_a.join(" ")
    end

    it "handles é etc" do
      d = DiceList.new(StringIO.new("Man Jéëves"))
      assert_equal "man jéëves", d.valid_words.to_a.join(" ")
    end

    it "skips words of length 2 or smaller" do
      d = DiceList.new(StringIO.new("O HA I O"))
      assert_empty d.valid_words
    end
  end

  describe 'creating a word list' do
    before do
      @list = DiceList.new(StringIO.new("AAA\nBBB\nCCC"))
    end
    it "has keys consisting out of dice throws" do
      assert_equal ['11111', '11112', '11113'], @list.word_list.keys
    end

    it "has values consisting out of words" do
      assert_equal ['aaa', 'bbb', 'ccc'], @list.word_list.values
    end

    it "can lookup a value" do
      assert_equal 'aaa', @list.word_list['11111']
    end
  end
end
