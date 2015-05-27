require 'set'

set = Set.new

for i in 2..100 do
  for j in 2..100 do
    set << i ** j
  end
end

p set.size
