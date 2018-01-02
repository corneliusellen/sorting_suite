require 'simplecov'

SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/insertion_sort'

class InsertionSortTest < Minitest::Test

  def test_it_exists
    sorter = InsertionSort.new([1, 2, 3])

    assert_instance_of InsertionSort, sorter
  end

  def test_assign_new_current
    sorter = InsertionSort.new([1, 2, 3])
    sorter.assign_new_current

    assert_equal 1, sorter.current
  end

  def test_insert_element_at_begining
    sorter = InsertionSort.new([1, 2, 3])
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element

    assert_equal [1], sorter.new_array
  end

  def test_insert_second_element_after_first
    sorter = InsertionSort.new([1, 2])
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element

    assert_equal [1, 2], sorter.new_array
  end

  def test_insert_third_element_after_first
    sorter = InsertionSort.new([1, 2, 3])
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element

    assert_equal [1, 2, 3], sorter.new_array
  end

  def test_insert_second_element_after_first_with_unordered_array
    sorter = InsertionSort.new([2, 1])
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element

    assert_equal [1, 2], sorter.new_array
  end

  def test_insert_third_element_after_first_with_unordered_array
    sorter = InsertionSort.new([3, 2, 1])
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element
    sorter.assign_new_current
    sorter.delete_current_from_array
    sorter.insert_element

    assert_equal [1, 2, 3], sorter.new_array
  end

  def test_sort_integration
    sorter = InsertionSort.new([3, 2, 1])

    assert_equal [1, 2, 3], sorter.sort
  end

  def test_sort_extreme_unordered_array
    sorter = InsertionSort.new([5, 7, 4, 3, 1, 2])

    assert_equal [1, 2, 3, 4, 5, 7], sorter.sort
  end

  def test_sort_letters
    sorter = InsertionSort.new(["d", "b", "a", "c"])

    assert_equal ["a", "b", "c", "d"], sorter.sort
  end

  def test_sort_array_of_equal_numbers
    sorter = InsertionSort.new([1, 1, 1])

    assert_equal [1, 1, 1], sorter.sort
  end

  def test_sort_empty_array
    sorter = InsertionSort.new([])

    assert_equal [], sorter.sort
  end

end
