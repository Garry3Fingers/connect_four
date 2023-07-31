# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/game_board'
require_relative 'lib/line_check'

# This module creates instance objects and starts the game
module StartGame
  def self.ask_names
    puts 'Enter the name of the first player'
    first_name = gets.chomp
    puts 'Enter the name of the second player'
    while true
      second_name = gets.chomp
      puts 'Enter another name' if second_name == first_name
      break if first_name != second_name
    end

    { first_name:, second_name: }
  end

  def self.start_game
    names = ask_names
    first_palyer = Player.new(names[:first_name], "\u26C4")
    second_player = Player.new(names[:second_name], "\u26C5")
    game_board = GameBoard.new
    game = Game.new(first_palyer, second_player, game_board, LineCheck.new(game_board.board))
    game.play
    play_again
  end

  def self.play_again
    puts 'Enter "yes" if you want to play again.'
    input = gets.chomp.downcase
    start_game if input == 'yes'
  end
end

# StartGame.start_game
