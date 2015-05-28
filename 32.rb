require 'set'

def unique_digits?(n)
  digits = Set.new
  while n > 0 do
    digit = n % 10
    unless digits.add? digit
      return false
    end
    n /= 10
  end
  true
end

def pandigital19?(n)
  return false unless unique_digits?(n.to_i)
  n.to_s.length == 9 && n.to_s.gsub('0', '').length == 9
end

set = Set.new

for i in 1..9876 do
  next unless unique_digits?(i)
  for j in 1..987 do
    next unless unique_digits?((i.to_s + j.to_s).to_i)
    product = i * j
    if(pandigital19?((i.to_s + j.to_s + product.to_s).to_i))
      set << product
    end
  end
end

p set.inject { |sum, k| sum + k}
