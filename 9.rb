for n in 1..333 do
	for m in (n+1)..666
		for p in n...(n+m) do
			puts n*m*p if p*p == n*n + m*m && n + m + p == 1000
		end
	end
end
