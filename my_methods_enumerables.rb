module Enumerable
  #  def my_each(iterable) NOPE. It is going to demand an iterable input which is NOT self.

  def my_each
    index = 0

    #using a for here would be cheating because the for loop calls the each method under the hood, which is forbidden by ODIN HIMSELF!!! Hope while does not do that because that would be cheating.

    #cannot be <=. self[length] = nil. self[length-1] = last
    while index<self.length
      yield self[index]
      index += 1
    end

    return self#yeah, the each method does this.
  end

  def my_each_with_index
    index = 0

    while index<self.length
      yield self[index], index
      index += 1
    end

    return self#yeah, the each method does this.
  end

  def my_select(&block)
    output = []
    self.my_each do |element|

      if block.call(element)==true #I am explicit.
        output << element
      end
    end

    return output
  end
  
  def my_select2
    output = []
    self.my_each do |element|

      if yield(element) ==true #I am explicit.
        output << element
      end
    end

    return output
  end
  
  def my_all?(&block)
    self.my_each do |element|
      if block.call(element)==false
        return false
      end    
  end

end
