
class Game

	def initialize
	  @rolls = Array.new
	end

	def roll(pins)
	  @rolls.push(pins)
	end	

	def score
	  frames = 0
	  position = 0
	  while position < @rolls.size
	    pins = @rolls[position]

	    position += 1
	    if(pins == 10)
		pins += sum(@rolls[position..(position+1)])
	    else
		pins += @rolls[position] || 0
		position += 1 unless position == @rolls.size

	        pins += @rolls[(position)] if pins == 10 && position < @rolls.size
	    end
	    frames += pins
	  end

	  frames
	end
	
	def sum(array)
	  array.inject(0) {|sum,item| sum += item}
	end
end
