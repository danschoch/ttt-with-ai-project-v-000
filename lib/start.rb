def play_again
  play_again = ""
  until play_again.downcase == "n" || play_again.downcase == "no"
    puts "Would you like to play again?"
    play_again = gets.strip
    play_again.downcase == "y" || play_again.downcase == "yes"
    game = Game.new
    until game.won?
      game.play
    end
  end
end

def zero_player_game
  game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
  until game.won?
    game.play
  end
  play_again
end

def one_player_game
  user_turn_selection
  until game.won?
    game.play
  end
  play_again
end

def user_turn_selection
  puts "Please select from the following tokens: X, O"
  puts "Player with token 'X' will go first."
  token_sel = gets.strip
  if token_sel == "X"
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  end
  if token_sel == "O"
    game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
  end
  game
end


end