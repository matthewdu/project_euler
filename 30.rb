def digit_fifth_sum(n)
  sum = 0
  while n > 0
    sum += (n % 10)**5
    n /= 10
  end
  sum
end

max_num = 5 * 9**5
numbers = []

for i in 2..max_num do
  numbers << i if i == digit_fifth_sum(i)
end

p numbers.inject { |sum, n| sum + n }
