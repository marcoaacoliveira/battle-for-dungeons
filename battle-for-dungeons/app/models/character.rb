class Character
	#atributos
	attr_accessor :name, :strength, :skill, :resistance, :armor, :fire_power, :current_hp
	attr_reader :max_hp
	
	
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
	
	
	private
	#calcular *hp*
	def calculate_health_points
		if @resistance == 0
			@max_hp = 1
		else
			@max_hp = @resistance.times.collect do 
				Die.roll
			end.inject(:+)
		end
		@current_hp = @max_hp 
	end
	
end
	
