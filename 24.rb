def factorial(n)
  product = 1
  while n > 0 do
    product *= n
    n -= 1
  end
  product
end

avail_digits = [0,1,2,3,4,5,6,7,8,9]
num = 1000000
i = 9
digits = []

while i > 0 do
  product = factorial i
  index = num / product
  if index >= avail_digits.length
    index -= 1
  end
  digits << avail_digits[index]
  avail_digits.delete_at(index)
  num %= product
  i -= 1
end

p digits.join.to_i
