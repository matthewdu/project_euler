array = (1..20).to_a
lcm = 1

array.each do |n|
	lcm = lcm.lcm(n)
end

puts lcm