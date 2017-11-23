#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

#---PSEUDO CODE---
#generate a substring
#look for substring in dictionary
#store any finding
#generate next substring...

def substring_sentence(string,dictionary)

  words_from_string = string.downcase.split(" ") #scans each word
  puts "words from string: #{words_from_string}"
  count_hash = Hash.new(0)

  words_from_string.each do |word|
    clean_word = string_cleanup(word).downcase
    substring_array = generate_substrings(clean_word)
    puts substring_array

    substring_array.each do |substring|
      if dictionary.include?(substring)
        count_hash[substring] += 1
      end
    end

    return count_hash
  end
end

def string_cleanup(string)
  clean_string = ""
  string.each_char do |char|
    if char =~ /[a-zA-Z]/
      clean_string += char
    end
  end

  #puts clean_string
  return clean_string
end

def generate_substrings(string)

  char_array = string.split("")
  substring_array= []

  char_array.each_with_index do |variable,idx|
    stop = char_array.index(char_array.last)
    #puts "idx1 = #{idx}"
    #puts "stop = #{stop}"

    (idx..stop).each do |idx2|
      #puts "idx2 = #{idx2}"
      #subword = word[idx,idx2] WRONG!!! word[idx,idx2]!=word[idx..idx2]
      substring = string[idx..idx2]
      substring_array<<substring
      #puts(subword)
    end
  end

  return substring_array
end
