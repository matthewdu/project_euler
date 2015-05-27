names_file = File.open('p022_names.txt')

names = names_file.gets.chomp.split(',').map { |n| n.gsub(/["\s]/, '') }.sort

sum = 0

for i in 0...(names.length) do
  name = names[i]
  name_score = 0
  for j in 0...(name.length) do
    name_score += name[j].ord - 64
  end
  sum += (i+1) * name_score
end

p sum
