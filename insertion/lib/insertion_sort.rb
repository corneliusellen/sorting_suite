class InsertionSort

  attr_reader :current,
              :new_array

  def initialize(array)
    @array = array
    @current = 0
    @new_array = []
    @counter = 0
  end

  def sort
    until @array.empty?
      assign_new_current
      delete_current_from_array
      insert_element
      sort
    end
    finish
  end

  def assign_new_current
    @current = @array[0]
  end

  def delete_current_from_array
    @array.delete_at(0)
  end

  def insert_element
    @counter = @new_array.count - 1
    until @counter == -1 || (@new_array[@counter] < @current)
      @counter = @counter - 1
    end
    @new_array.insert(@counter + 1, @current)
  end

  def finish
    @new_array
  end

end
