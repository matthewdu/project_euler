def palindrome?(str)
  str == str.reverse
end

sum = 0

for i in 1...1000000 do
  sum += i if palindrome?(i.to_s) && palindrome?(i.to_s(2))
end

p sum
