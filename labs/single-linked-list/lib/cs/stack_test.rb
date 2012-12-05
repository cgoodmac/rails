class StackTest

  def main(value)
    factorial(value)
  end

  def factorial(value)

    if value > 1
      value * factorial(value - 1)
    else
      1
    end

  end

  def head(value)
    fib(value)
  end

  def fib(value)
    if value > 2
      fib(value-1) + fib(value-2)
    else
      1 # if 1 or 2, returns 1, from 1 1 2 3
    end
  end

  def run(value)
    x(value)
  end

  def x(value)
    if value != 1
      x(value - 1)
    end
    puts value
  end

# practice
  def test(value)
    y(value)
  end

  def y(value)

    if value < 100
      value + y(value + 1)
    else
      100
    end

  end

end