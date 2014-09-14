array = (1..100).to_a
sumOfSquares = array.inject { |product, n| product + n*n }
squareOfSum = array.inject { |sum, n| sum + n }
squareOfSum *= squareOfSum

puts squareOfSum - sumOfSquares