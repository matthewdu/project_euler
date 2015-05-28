def num_ways(n, i)
  return 1 if n == 0
  ways = 0
  if(n - 200 >= 0 && 200 <= i)
    ways += num_ways(n-200, 200)
  end
  if(n - 100 >= 0 && 100 <= i)
    ways += num_ways(n-100, 100)
  end
  if(n - 50 >= 0 && 50 <= i)
    ways += num_ways(n-50, 50)
  end
  if(n - 20 >= 0 && 0 && 20 <= i)
    ways += num_ways(n-20, 20)
  end
  if(n - 10 >= 0 && 10 <= i)
    ways += num_ways(n-10, 10)
  end
  if(n - 5 >= 0 && 5 <= i)
    ways += num_ways(n-5, 5)
  end
  if(n - 2 >= 0 && 2 <= i)
    ways += num_ways(n-2, 2)
  end
  if(n - 1 >= 0 && 1 <= i)
    ways += num_ways(n-1, 1)
  end
  ways
end

p num_ways(200, 200)
