def proper_divisor_sum(n)
  sum = 1
  for i in 2..(Math.sqrt(n).floor) do
    if n % i == 0
      sum += i
      sum += n/i unless n == i * i
    end
  end
  sum
end

def abundant_number_sum?(n, abundant_numbers)
  flag = false
  for i in 1..(n / 2) do
    if abundant_numbers[i] && abundant_numbers[n-i]
      flag = true
    end
  end
  flag
end

abundant_number = []
abundant_number[0] = false

for i in 1..28123 do
  if i < proper_divisor_sum(i)
    abundant_number[i] = true
  else
    abundant_number[i] = false
  end
end

# for i in 0..100 do
#   puts "#{i}: #{abundant_number[i]}"
# end

non_abundant_num_sum = 0

for i in 1..28123 do
  if !abundant_number_sum?(i, abundant_number)
    non_abundant_num_sum += i
  end
end

puts non_abundant_num_sum
