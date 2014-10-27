arr = []

while(inputLine = gets)
	arr << inputLine.chomp.split(" ").map{ |e| e.to_i}
end

puts arr.to_s

13.downto(0).each do |n|
	(0..n).each do |m|
		arr[n][m] += arr[n+1][m] > arr[n+1][m+1] ? arr[n+1][m] : arr[n+1][m+1]
	end
end

puts arr[0][0]