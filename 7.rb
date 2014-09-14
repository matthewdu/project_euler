arr = (0..1000000).to_a

arr.each do |n|
	next if n.nil? || n == 0 || n == 1
	m = 2*n
	while m < arr.length
		arr[m] = nil
		m += n
	end
end

arr.delete nil
arr.delete 0
arr.delete 1

puts arr[10000]