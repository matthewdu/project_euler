factorials = [1]

for i in 1..9 do
  factorials[i] = factorials[i-1] * i
end

curious_nums = []

for i in 3..(factorials[9] * 7) do
  sum = 0
  n = i
  while n > 0
    sum += factorials[n % 10]
    n /= 10
  end
  curious_nums << i if sum == i
end

p curious_nums.inject { |sum, k| sum +k }
