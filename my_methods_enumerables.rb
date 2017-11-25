module Enumerable
  #This was an awesome exercise. implement my_* is a great way of learning a language.

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

    if block==nil
      self.my_each do |element|
        #puts "block==nil"
        if element==nil or element==false

          return false
        end
      end
    else


      self.my_each do |element|
        if block.call(element)==false

          return false
          #efficient. if it fails once, breaks the loop and returns false.
        end
      end
    end

    return true
  end

  def my_any?(&block)

    if block==nil
      self.my_each do |element|
        #puts "block==nil"
        if element!=nil and element!=false

          return true
        end
      end
    else


      self.my_each do |element|

        if block.call(element)!=false
          #puts "block.call(element)!=false"
          return true
        end
      end
    end

    return false

  end

  def my_none?(&block)

    #the opposite of all.
    if block==nil
      self.my_each do |element|
        puts "block==nil"
        if element==true

          return false
        end
      end
    else

      self.my_each do |element|
        if block.call(element)==true
          return false

          #efficient. if it fails once, breaks the loop and returns false.
        end
      end
    end
    return true
  end

  def my_count(argument=nil, &block)
    count = 0

    if argument!=nil
      self.my_each do |element|
        if element==argument
          count+=1
        end
      end
      return count
    end

    if block!=nil
      self.my_each do |element|
        if block.call(element)==true
          count+=1
        end
      end
      return count
    end

    self.my_each do |element|
      count+=1
    end

    return count
  end

  def my_inject(argument=nil, &block)

    if argument!=nil
      accumulator = argument
    else
      accumulator = self[0]
    end
    puts "accumulator_0 = #{accumulator}"

    self.my_each do |element|
      accumulator = block.call(accumulator, element)
    end

    return accumulator
  end

  def my_map(&block) #block implementation transforming it into a proc
    out = []
    if block==nil
      return Enumerator
    end

    self.my_each do |element|
      out << block.call(element)
    end
    

    return out
  end

  def my_map2 #block implementation using yield
    out = []

    if block_given?

      self.each do |element|
        out_element = yield element
        out << out_element
      end

    else
      return Enumerator
    end

    return out
  end

  def my_map3(aproc=nil, &block) #aproc argument and block implementation
    out = []
    #if both are nil, returns an Enumerator.
    if aproc==nil and block_given?!=true
      return Enumerator
    end

    #if aproc is given, uses it to create the out array.
    if aproc!=nil
      self.each do |element|
        out << aproc.call(element)
      end
      return out
    end

    #if only a block is given the block is passed AS a aproc recursively. sweet.
    my_map3(block)
  end

end
