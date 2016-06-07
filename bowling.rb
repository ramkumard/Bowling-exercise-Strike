class Bowling
	def initialize
		@board = Array.new(20,0)
		@current = 0
		@score = 0 
		@frame = 0
	end

	def roll(no)
		@board[@current] = no 
		@current += 1
	end

  # Score:
  # When user enters to roll.
  # Compute score and logic to compute the score
  #    ++ Check strike.
  #    ++ Check spare.

	def score
		(0..9).each do |row|
			if is_strike?(@frame) 
				@score += 10 + strike_bonus(@frame)
				@frame += 1
			elsif (is_spare?(@frame)) 
				@score += 10 + spare_bonus(@frame)
				@frame += 2
			else
				@score += sum(@frame)
				@frame += 2
		  end
		end
		return @score
	end

	private
	# USECASES:
  # 1. Check frame is strike ? 
  # 2. Check frame is spare ?
  # 3. Strike Bonus 
  # 4. Spare Bonus
  # 5. Calculation for total

  # Parameters:
  # Frame no

	def is_strike?(frame)
		@board[frame] == 10
	end

	def is_spare?(frame) 
		sum(frame) == 10
	end

	def strike_bonus(frame) 
		sum(frame+1)
	end

	def spare_bonus(frame)
		@board[frame+2]
	end

	def sum(frame) 
		@board[frame] + @board[frame+1]
	end

end

class Game
  class << self
    def play()
    	board = Bowling.new()
    	puts "Please provide no of bowl"
    	bowl = gets.chomp.to_i
    	(1..bowl).each do |b|
    		puts "Please provide pins knocked"
    		pins = gets.chomp.to_i
    		board.roll(pins)
    	end
    	total = board.score()
    	puts "The total is #{total}"
    end
  end
end

while true
  puts "Do you want to play again? (y/n)"
  if ["no","n"].include? (gets.chomp.downcase)
    puts "Thanks for playing"
    break
  end
  Game.play()
end