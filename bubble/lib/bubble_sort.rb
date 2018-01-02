class BubbleSort

  attr_reader :previous,
              :current,
              :count,
              :array,
              :stopper

  def initialize(array)
    @sorted_count = 0
    @sorted = false
    @array = array
    @count = 0
    @previous = @array[@count]
    @current = @array[@count + 1]
    if array.empty?
      raise ArgumentError
    end
  end

  def sort
    if @sorted == true
      finished
    elsif @previous > @current
      switch
      advance
      sort
    else
      advance
      sort
    end
  end

  def advance
    @count += 1
    @previous = @array[@count]
    @current = @array[@count + 1]
    if @current == nil
      start_over
    end
  end

  def switch
    @sorted_count += 1
    @array[@count], @array[@count + 1] = @array[@count + 1], @array[@count]
  end

  def start_over
    if @sorted_count == 0
      @sorted = true
    else
      reset
    end
  end

  def reset
    @count = 0
    @sorted_count = 0
    @previous = @array[@count]
    @current = @array[@count + 1]
  end

  def finished
    @array
  end

end
