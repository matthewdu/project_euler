day = 2
sundays = 0

dates = [
31,
28,
31,
30,
31,
30,
31,
31,
30,
31,
30,
31
]

for i in 1..100 do
  for j in 1..12 do
    days = dates[j-1]
    days += 1 if i%4 == 0 && j == 2
    day += days
    sundays += 1  if day % 7 == 0
  end
end

puts sundays
