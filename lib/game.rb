# frozen_string_literal: true

# This class implements the game loop
class Game
  attr_reader :first_player, :second_player, :game_board, :line_checker

  def initialize(first_player, second_player, game_board, line_cheker)
    @first_player = first_player
    @second_player = second_player
    @game_board = game_board
    @line_checker = line_cheker
  end

  def play
    start_message

    while moves?
      return first_player_won if first_player_move == true
      return second_player_won if second_player_move == true
    end

    puts "It's a draw. Thanks for playing!"
  end

  private

  def start_message
    puts ''
    puts <<~MESSAGE
      Connect Four is a two-player connection rack game,
      in which the players take turns dropping tokens into a six-row,
      seven-column vertically suspended grid.
      The objective of the game is to be the first to form a horizontal,
      vertical, or diagonal line of four of one's own tokens.
    MESSAGE
  end

  def display_board
    game_board.display_board
  end

  def verify_input(input)
    return true if game_board.board[0][input - 1] == first_player.token ||
                   game_board.board[0][input - 1] == second_player.token

    false
  end

  def player_input(player)
    input = player.input
    raise WrongColumn, "\nThere is no available space in this column! Choose others!"\
    if verify_input(input) == true
  rescue WrongColumn => e
    puts e
    puts ''
    retry
  else
    input
  end

  def first_player_move
    display_board
    token = first_player.token
    input = player_input(first_player)
    game_board.apply_change(token, input)
    line_checker.check(token)
  end

  def first_player_won
    display_board
    puts "#{first_player.name} won the game!"
  end

  def second_player_move
    display_board
    token = second_player.token
    input = player_input(second_player)
    game_board.apply_change(token, input)
    line_checker.check(token)
  end

  def second_player_won
    display_board
    puts "#{second_player.name} won the game!"
  end

  def moves?
    game_board.available_space?
  end
end

class WrongColumn < StandardError; end
