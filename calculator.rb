strength = gets.chomp

atk = strength.to_i

t_atk = atk.times.collect do
	rand(6)+1
end.inject(:+)


armor = gets.chomp

defense = armor.to_i

t_def = defense.times.collect do
	rand(6)+1
end.inject(:+)

total = t_atk-t_def

puts "O dano foi #{total}"
