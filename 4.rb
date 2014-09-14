max = 0

(1..999).reverse_each do |n|
	(1..999).reverse_each do |m|
		if (n*m).to_s == (n*m).to_s.reverse
			if (m*n) > max
				max = m*n
			end
		end
	end
end

puts max