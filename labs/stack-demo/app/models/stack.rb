class Stack
  def initialize  
    @data = []
  end

  def push(value)
    @data[@data.count] = value
  end

  def pop
    @data.delete(@data[-1])
  end

  def to_s # this runs automatically when you call, overrides the <object> thingy
    "There are #{@data.length} items in the stack: #{@data}"
  end

end