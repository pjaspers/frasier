require "helper"

describe Frasier::Book do

  it "does not go Niles when thrown nil" do
    assert_raises ArgumentError do
      Frasier::Book.new(nil)
    end
  end

  it "sets a pretty title from a path" do
    assert_equal "My Man Jeeves", Frasier::Book.new("~/p.g wodehouse/my_man_jeeves").title
  end
end
