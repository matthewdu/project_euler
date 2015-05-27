sum = 1

i = 1
cur_diff = 2

while i < 1001 * 1001 do
  for j in 1..4 do
    i += cur_diff
    sum += i
  end
  cur_diff += 2
end

p sum
