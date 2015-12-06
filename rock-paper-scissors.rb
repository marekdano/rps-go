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


$things = {"rock" => 0, "paper" => 1, "scissors" => 2}

def start_game
  puts "Start to play you have 10 chances to beat the computer!!!"
  puts "If you want to stop early, hit space during the game."
  space = nil
  i = 0
  while i < 10 || space != " " 
    puts "Choose rock or paper or scissors"
    user = gets.chomp

    while $things.has_value? user == false
      puts "You didn't choose the right choice. Choose please rock or paper or scissors"
      user = gets.chomp
    end

    get_winner computer_choice, $things[user]
    
    puts "If you want to stop early, hit space."
    space = gets.chomp
    if space == " "
      puts "Game is over"
      break
    end

    i=i+1

  end
end

def computer_choice 
  random_num = Random.new
  random_num.rand(0..2)
end

def get_winner computer, user 
  # rock - scissors   0 - 2 = -2 wins
  # rock - paper      0 - 1 = -1 loses
  # paper - rock      1 - 0 = 1  wins
  # paper - scissors  1 - 2 = -1 loses
  # scissors - paper  2 - 1 = 1  wins
  # scissors - rock   2 - 0 = 2  loses

  puts "Computer: #{$things.key(computer)}"
  puts "User: #{$things.key(user)}"

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

start_game
#computer = random_num.rand(0..2)
#user = random_num.rand(0..2)

#puts "computer: #{things.key(computer)} user: #{things.key(user)}"


#get_winner computer, user

