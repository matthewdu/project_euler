arr = []
arr[0] = 0
i = 1

while i < 10000 do
  factor_sum = 1
  for j in 2..(Math.sqrt(i).floor) do
    if i%j == 0
      factor_sum += j
      factor_sum += i/j unless i == j*j
    end
  end
  arr[i] = factor_sum
  i += 1
end


amicable_numbers = []

i = 1
while i < 10000 do
  if i == arr[arr[i]] && i != arr[i]
    amicable_numbers << i
  end
  i += 1
end

puts amicable_numbers.inject{ |sum, n| sum + n }
