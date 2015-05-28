require 'prime'

# prime numbers up to and including n
def prime_numbers(n)
  array = Array.new(n+1, true)
  array[0] = false
  array[1] = false
  prime_numbers = []
  for i in 2..n do
    next unless array[i]
    prime_numbers << i
    j = i + i
    while j <= n
      array[j] = false
      j += i
    end
  end
  prime_numbers
end

# check prime faster by only dividing by other primes
def prime?(n, sieve)
  sieve.each do |i|
    break if i > Math.sqrt(n).floor
    return false if n % i == 0
  end
  true
end

def truncated_prime?(n, sieve)
  str = n.to_s
  arr = []
  for i in 1..str.length do
    arr << str[0, i].to_i
    arr << str[i-1..str.length].to_i
  end
  arr.each do |i|
    return false if i == 1 || i == 0
    return false unless prime?(i, sieve)
  end
  true
end

sieve = []
Prime.each(1000000) { |n| sieve << n }

arr = []
sieve.each do |n|
  next if n < 10
  arr << n if truncated_prime?(n, sieve)
end

p arr.inject { |sum, k| sum + k }
# while true do
#   a = gets.chomp
#   p truncated_numbers a
# end
