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

things = ["rock", "paper", "scissors"]

puts things.include? "rock"

# rock - scissors   0 - 2 = -2 wins
# rock - paper      0 - 1 = -1 loses
# paper - rock      1 - 0 = 1  wins
# paper - scissors  1 - 2 = -1 loses
# scissors - paper  2 - 1 = 1  wins
# scissors - rock   2 - 0 = 2  loses

puts "It's a tie!!!"