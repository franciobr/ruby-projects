#implement bubble sort on ruby.
#compare element i to element i+1, swap if i>i+1
#swap_count=+1. if 0 halt.
#repeat until no swaps.

def bubble_sort(array)
  halt=0
  old = 0

  while true
    swap_count = 0

    #this is a very messy way all but the last index...gotta find another one.
    (0...array.length-1).each do |index|
      
      # if index==(array.length+1)
      #   next
      # end
      puts "array = #{array}, swap = #{swap_count}, index = #{index}, old = #{old}"
      if array[index] > array[index+1]

        # old = array[index]
        # array[index] = array[index+1]
        # array[index+1] = old
        array[index], array[index+1] = array[index+1], array[index]
        swap_count += 1
      end
    end

    if swap_count==0
      break
    end
  end
  
  return array
end

#bubble_sort_by([5,4,1,3,2]) {|left, right| left - right}
def bubble_sort_by(array, &block)
  swap = nil

  until swap == false do

    swap = false
    (0...array.length-1).each do |index|
      if yield(array[index],array[index+1])>0
        array[index], array[index+1] = array[index+1], array[index]
        swap = true
      end
    end    
  end
  return array 
end