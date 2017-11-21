def caesar_cipher(entry,shift)
  ''' caesar_cipher(entry,shift)
      entry = string to be encrypted
      shift = integer encription key
  '''
  out = ''
  #.to_a.join to make it a string.
  alphabet = ('a'..'z').to_a
  upper_alphabet = ('A'..'Z').to_a

  #ruby way
  entry.each_char do |char|

    if alphabet.include?(char)  
      index = alphabet.index(char)
      out << alphabet[index+shift]

    elsif upper_alphabet.include?(char)
      index = upper_alphabet.index(char)
      out << upper_alphabet[index+shift]

    else
      out << char
    end

  end

  #python way...
  # for s in entry.each_char
  #   index = alphabet.index(s)
  #   new_char = alphabet[index+shift]
  #   out << new_char
  #   puts out
  # end

  return out

end