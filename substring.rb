#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

#---PSEUDO CODE---
#generate a substring
#look for substring in dictionary
#store any finding
#generate next substring...

def substring(word, dictionary)

  w_array = word.split("")
  w_hash = Hash.new(0)

  w_array.each_with_index do |variable,idx|
    stop = w_array.index(w_array.last)#why do I need +1!?
    #puts "idx1 = #{idx}"
    #puts "stop = #{stop}"
    (idx..stop).each do |idx2|
      #puts "idx2 = #{idx2}"
      #subword = word[idx,idx2] WRONG!!! word 
      subword = word[idx..idx2]
      puts(subword)
      if dictionary.include?(subword)
        w_hash[subword] += 1

      end

    end

  end
  return w_hash
end
