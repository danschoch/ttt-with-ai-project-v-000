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
