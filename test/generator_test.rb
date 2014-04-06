require 'helper'

describe 'generating a passphrase' do
  before do
    @g = Generator.new({'11111' => 'aaa',
                        '11112' => 'bbb',
                        '11113' => 'ccc'}, 3)

    def @g.roll
      1
    end
  end

  it 'picks random words based on roll' do
    assert_match /aaa|^bbb|^ccc/, @g.passphrase
  end

  it 'respects number_of_words' do
    assert 3 == @g.passphrase.split(" ").length, "#{@g.passphrase} has a length of 3"
  end

  it 'calculates entropy' do
    assert_equal 3 ** 3, @g.entropy
  end

  it 'understands bits of entropy' do
    assert_equal 4.75, @g.bits_of_entropy
  end
end
