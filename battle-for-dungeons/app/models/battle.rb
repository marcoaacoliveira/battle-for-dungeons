class Battle
	attr_accessor :challenger, :opponent

	def initialize(params = {})
		@challenger = params[:challenger]
		@opponent	= params[:opponent]
	end
	
	def initiative
		(Die.roll > Die.roll) ?  [challenger, opponent] : [opponent, challenger]
	end
	
	def start
		@challenger.current_hp = @challenger.max_hp
		@opponent.current_hp = @opponent.max_hp
		first, last = initiative
		until (@challenger.current_hp <= 0) || (@opponent.current_hp <= 0)
			r = Round.new(:challenger => @challenger, :opponent => @opponent)
			r.start
		end
		(@challenger.current_hp > 0) ? puts("O vencedor foi #{@challenger.name}") : puts("O vencedor foi #{@opponent.name}")
	end
	
end

class Battle::Round
	attr_accessor :challenger, :opponent
	def initialize(params = {})
		@challenger = params[:challenger]
		@opponent = params[:opponent]
	end
	
	def start
		t1 = Turn.new(:attacker => @opponent, :defensor => @challenger)
		t1.start 
		if @challenger.current_hp > 0
			t2 = Turn.new(:attacker => @challenger, :defensor => @opponent)
			t2.start
		end
		puts("Nome: #{@challenger.name} HP: #{@challenger.current_hp}")
		puts("Nome: #{@opponent.name} HP: #{@opponent.current_hp}")
	end
end

class Battle::Round::Turn
	attr_accessor :attacker, :defensor
	
	def initialize(params = {})
		@attacker =  params[:attacker]
		@defensor = params[:defensor]
	end
		
	def start
		dmg = @attacker.attack - @defensor.defend
		@defensor.current_hp  -= dmg if dmg > 0
	end
		
end
