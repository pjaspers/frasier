require "helper"

describe Frasier::Book do

  it "does not go Niles when thrown nil" do
    assert_raises Errno::ENOENT do
      Frasier::Book.new(nil)
    end
  end

  it "sets a pretty title from a path" do
    File.stub "exist?", true do

      assert_equal "My Man Jeeves", Frasier::Book.new("~/p.g wodehouse/my_man_jeeves").title
    end
  end

  it 'converts to diceware' do
    test_file = File.join(File.dirname(__FILE__), "files", "small_sample")
    assert Frasier::Book.new(test_file).dice_word_list.length > 1
  end

end
