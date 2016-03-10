class GameController < ApplicationController

  def index
  end

  def play 
    @player_name = params[:user_name]

    @wins = params[:wins].to_i
    @losses = params[:losses].to_i
  end

  def compare
    @player_name = params[:user_name]

    if params.has_key?(:wins) && params.has_key?(:losses)
      wins = params[:wins].to_i
      losses = params[:losses].to_i
      @user = params[:image]
      user_by_number = get_items[@user]
      computer_by_number = computer_choice
      @computer = get_items.key(computer_by_number)

      @result = get_winner computer_by_number, user_by_number, wins, losses  
      if @result === "won"
        @wins = wins + 1
        @losses = losses
        @result_string = "You win!!! Congratulation!!!"
      elsif @result === "lost"
        @losses = losses + 1
        @wins = wins
        @result_string = "You lost :("
      else
        @wins = wins
        @losses = losses
        @result_string = @result
      end
    end
  end
  

  private

  def get_items 
    {"rock" => 0, "paper" => 1, "scissors" => 2}
  end
  
  def computer_choice 
    random_num = Random.new
    random_num.rand(0..2)
  end

  def get_winner computer, user, wins, losses
    # rock - scissors   0 - 2 = -2 wins
    # rock - paper      0 - 1 = -1 loses
    # paper - rock      1 - 0 = 1  wins
    # paper - scissors  1 - 2 = -1 loses
    # scissors - paper  2 - 1 = 1  wins
    # scissors - rock   2 - 0 = 2  loses

    puts "Computer: #{computer}"
    puts "User: #{user}"

    if [-2,1].include? (computer - user)
      puts "You lost :("
      "lost"
    elsif [-1,2].include? (computer - user)
      puts "You win!!! Congratulation!!!"
      "won"
    elsif computer - user == 0
      puts "It's a tie!!!"
      "It's a tie!!!"
    else
      puts "Something went wrong."
      "Something went wrong."
    end
  end

end
