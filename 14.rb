arr = [0, 1]
i = 1
while true
	if arr[i] > 1000000 && arr[i].odd?
		arr.delete(arr[i])
	end

	if arr[i].even?
		if (arr[i] - 1) % 3 == 0
			arr << (arr[i] - 1) / 3
		else
			arr << arr[i] * 2
		end
		i += 1
	else
		arr << arr[i] * 2
		i +=1
	end
end