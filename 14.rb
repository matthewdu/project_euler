timeStart = Time.now
cache = [0,1]

def collatz_length(n, cache)
	count = 0 
	i = n;
	while cache[i].nil?
		if i.even?
			i = i/2
		else
			i = 3*i + 1
		end
		count += 1	
	end
	count += cache[i]
	cache[n] = count
	count
end

maxNumber = 1
collatzLength = 1

(1..1000000).each do |n|
	
	currLength = collatz_length(n, cache)
	if currLength > collatzLength
		maxNumber = n
		collatzLength = currLength
	end
end

puts "#{maxNumber} with length #{collatzLength}"
puts "took #{Time.now - timeStart}"