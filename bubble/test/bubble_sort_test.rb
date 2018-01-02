require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/bubble_sort'

class BubbleSortTest < Minitest::Test

  def test_it_exists
    sorter = BubbleSort.new([1, 2, 3])
    assert_instance_of BubbleSort, sorter
  end

  def test_can_point_to_previous
    sorter = BubbleSort.new([1, 2, 3])
    assert_equal 1, sorter.previous
  end

  def test_advance_can_increase_count
    sorter = BubbleSort.new([1, 2, 3])
    sorter.advance

    assert_equal 1, sorter.count
  end

  def test_advance_can_change_previous_to_current
    sorter = BubbleSort.new([1, 2, 3])
    sorter.advance

    assert_equal 2, sorter.previous
  end

  def test_advance_can_change_current_to_next
    sorter = BubbleSort.new([1, 2, 3])
    sorter.advance

    assert_equal 3, sorter.current
  end

#this test isn't relevant anymore, but it helped me in the development of my code. Is it good practice to write tests that help you with development but delete them later??
  def test_current_can_be_nil
    skip
    sorter = BubbleSort.new([1, 2, 3])
    sorter.advance
    sorter.advance

    assert_nil sorter.current
  end

  def test_can_switch_previous_and_current
    sorter = BubbleSort.new([2, 1, 3])
    sorter.sort

    assert_equal [1, 2, 3], sorter.array
  end

  def test_can_output_array_when_done_sorting
    sorter = BubbleSort.new([2, 1, 3])

    assert_equal [1, 2, 3], sorter.sort
  end

  def test_can_output_long_array_when_done_sorting
    sorter = BubbleSort.new([2, 3, 6, 4, 1, 5])

    assert_equal [1, 2, 3, 4, 5, 6], sorter.sort
  end

  def test_can_sort_letters
    sorter = BubbleSort.new(["d", "b", "a", "c"])

    assert_equal ["a", "b", "c", "d"], sorter.sort
  end

  def test_can_sort_extreme_array
    sorter = BubbleSort.new([6, 5, 4, 3, 2, 1])

    assert_equal [1, 2, 3, 4, 5, 6], sorter.sort
  end

  def test_raises_argument_when_passed_empty_array
    assert_raises ArgumentError do
      BubbleSort.new([])
    end
  end

  def test_can_sort_array_of_equal_numbers
    sorter = BubbleSort.new([1, 1, 1])

    assert_equal [1, 1, 1], sorter.sort
  end

end
