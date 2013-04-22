class Character
	#atributos
	attr_accessor :name, :strength, :skill, :resistance, :armor, :fire_power, :max_health_points
	
	
	#incializador
	def initialize(params = {})
		@name = params[:name] || ""
		@strength = params[:strength] || 0
		@skill = params[:skill] || 0
		@resistance = params[:resistance] || 0
		@armor = params[:armor] || 0
		@fire_power = params[:fire_power] || 0
		calculate_health_points
	end
	
	#atacar
	def attack
		@strength.times.collect do
			Die.roll
		end.inject(:+)
	end


	#defender
	def defend
		@armor.times.collect do
			Die.roll
		end.inject(:+)
	end
	
	#calcular *hp*
	def calculate_health_points
		if @resistance == 0
			@max_health_points = 1
		else
			@max_health_points = @resistance.times.collect do 
				Die.roll
			end.inject(:+)
		end
	end
	
end
	
