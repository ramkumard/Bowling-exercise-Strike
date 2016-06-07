require File.dirname(__FILE__) + '/test_helper'

# This is the test Class for Bowling class

class BowlingTest < Test::Unit::TestCase
  def setup
    @board = Bowling.new()
  end

  def test_one_spare
    @board.roll(3)
    @board.roll(7)
    @board.roll(3)
    @board.roll(4)
    assert_equal(20, @board.score())
  end

  def test_less_than_10
    @board.roll(4)
    @board.roll(4)
    assert_equal(8, @board.score())
  end

  def test_zero
    @board.roll(0)
    @board.roll(0)
    assert_equal(0, @board.score())
  end

  def test_strike_every_roll
    (1..12).each do |j|
        @board.roll(10);
    end
    assert_equal(300, @board.score());
  end

  def test_all_ones()
     (1..20).each do |j|
        @board.roll(1);
    end
    assert_equal(20, @board.score());
  end

  def test_one_strike
    @board.roll(10);
    @board.roll(3);
    @board.roll(4);
    assert_equal(24, @board.score());
  end

end