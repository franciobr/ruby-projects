class Dog
  attr_accessor :name, :height, :weight
  def bark
    puts "generic bark"
  end

  # def :name=(new_name)
  #   if new_name.is_a?(Numeric)
  #     puts "Cannot be an umber"
  #   end
  # end
end