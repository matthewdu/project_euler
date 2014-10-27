def numOfFactor(n)
	i = 2
	factors = 0
	while i <= n do
		if n % i == 0
			factors += 1
			n /= i
		end
		i += 1
	end
	return factors * 2 + 2
end

i = 2
arr = [0, 1]

while 1 == 1 do
	if numOfFactor(arr[i-1]) > 500
		puts arr[i-1]
		break
	end
	puts numOfFactorsarr[i-1]
	arr[i] = i + arr[i-1]
	i += 1
end