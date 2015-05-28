# returns array where array[index] is true if index is prime
# n is the maximum index
def prime_sieve(n)
  array = Array.new(n+1, true)
  array[0] = false
  array[1] = false
  for i in 2..n do
    next unless array[i]
    j = i + i
    while j <= n do
      array[j] = false
      j += i
    end
  end
  array
end

def circular_prime?(n, prime_sieve)
  i = n.to_s.length
  m = n
  i.times do
    last_digit = m % 10
    m /= 10
    m += last_digit * 10**(i-1)
    return false unless prime_sieve[m]
  end
  true
end

num = 0
arr = prime_sieve(1000000)

for i in 2..1000000 do
  num += 1 if circular_prime?(i, arr)
end

p num

# puts circular_prime?(197, prime_sieve(1000))

# arr = prime_sieve 100
# 
# for i in 0..100 do
#   puts "#{i}: #{arr[i]}"
# end
