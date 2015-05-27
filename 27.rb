def prime?(n)
  return false if n != n.abs
  for i in 2..(Math.sqrt(n).floor) do
    return false if n % i == 0
  end
  true
end

a = 0
b = 0
max_prime = 0

i = -999
while i < 1000 do
  j = -999
  while j < 1000 do
    k = 0
    cur_max_prime = 0
    while prime?(k*k + i*k + j) do
      cur_max_prime += 1
      k += 1
    end
    if cur_max_prime > max_prime
      max_prime = cur_max_prime
      a = i
      b = j
    end
    j += 1
  end
  i += 1
end

p a*b
