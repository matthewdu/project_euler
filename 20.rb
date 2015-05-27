a = 1

(1..100).each do |n|
	a *= n
end

sum = 0

while a > 0
  sum += a % 10
  a /= 10
end

puts sum
