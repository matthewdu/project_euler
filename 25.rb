def digits_in_num(n)
  digits = 0
  while n > 0
    n /= 10
    digits += 1
  end
  digits
end

index = 2
f_1 = 1
f_2 = 1

while digits_in_num(f_2) < 1000
  temp = f_1 + f_2
  f_1 = f_2
  f_2 = temp
  index += 1
end

p index
