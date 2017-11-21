#Implement a method stock_picker that takes in an array of stock prices, one for each hypothetical #day. It should return a pair of days representing the best day to buy and the best day to sell. #Days start at 0.

#Ruby way of looping
def stock_picker(prices)

  profit = 0.0#edge case where there is no profit not covered
  indexes = [0,0]

  prices.each do |buy|
    #I hate the line below.
    prices[prices.index(buy)..prices.index(prices.last)].each do |sell|
      
      if sell-buy>profit
        profit = sell-buy
        indexes = [prices.index(buy), prices.index(sell)]
      end

    end

  end

  return "Days:#{indexes}, Profit:#{profit}"

end

#Pythonlike looping implementation
# def stock_picker array 
#   profit = 0 
#   for i in 0...array.length
#     for j in (i+1)...array.length
#       if((array[j] - array[i]) > profit)
#         profit = array[j] - array[i]
#         buyday = i
#         sellday = j
#       end
#     end
#   end
#   days = [buyday, sellday]
#   puts days
# end
