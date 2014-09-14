arr = (0...2000000).to_a

arr.each do |n|
	next if n == 0 || n == 1 || n.nil?
	m = n * 2
	while m < 2000000 do
		arr[m] = nil
		m += n
	end
end

arr.compact!
arr.delete(1)
puts arr.inject { |sum, n| sum + n }