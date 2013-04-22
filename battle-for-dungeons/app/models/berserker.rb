class Berserker < Character
	def initialize(params = {})
		super params
		@strength = strength_bonus
	end

	def defend
		((super - 2) < 0) ? super - 2 : 0 
	end
	
	private
	def strength_bonus
		((@strength + 2) > 7) ? @strength + 2 : 7
	end

end

