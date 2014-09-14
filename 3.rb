i = 2
n = 600851475143
factors = []
while n != 1 do
	if n%i == 0
		factors << i
		n /= i
	end
	i += 1
end

puts factors