class Characters

	attr_accessor :name, :strength, :skill, :resistance, :armor, :fire_power
	

	def attack
		damage = :strength.times.collect do
			Die.roll
		end.inject(:+)
	end


	def defend
		defense = :skill.times.collect do
		Die.roll
		end.inject(:+)
	end
	
	
end
	
