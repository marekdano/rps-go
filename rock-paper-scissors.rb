# ###################################################################
#
# Each player chooses "rock", "paper", or "scissors" simultaneously.
# Then, they compare their choices to see who has won:
# Rock beats scissors, but loses against paper.
# Paper beats rock, but loses against scissors.
# Scissors beats paper, but loses against rock.
# If both players have the same choice, it's a tie.
#
# ###################################################################


things = {"rock" => 0, "paper" => 1, "scissors" => 2}
random_num = Random.new

def get_winner computer, user 
  # rock - scissors   0 - 2 = -2 wins
  # rock - paper      0 - 1 = -1 loses
  # paper - rock      1 - 0 = 1  wins
  # paper - scissors  1 - 2 = -1 loses
  # scissors - paper  2 - 1 = 1  wins
  # scissors - rock   2 - 0 = 2  loses

  if [-2,1].include? (computer - user)
    puts "You lost :("
  elsif [-1,2].include? (computer - user)
    puts "You win!!! Congratulation!!!"
  elsif computer - user == 0
    puts "It's a tie!!!"
  else
    puts "Something went wrong."
  end
end

computer = random_num.rand(0..2)
user = random_num.rand(0..2)

puts "computer: #{things.key(computer)} 
    user: #{things.key(user)}"


get_winner computer, user

