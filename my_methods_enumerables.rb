def Enumerable
  def my_each(iterable)
    index = 0
    while index<iterable.length
      yield iterable[index]
      index += 1
    end
  end
end