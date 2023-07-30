# frozen_string_literal: true

# This class implements the playing field for the game.
# It has public interfaces #apply_change, #available_space and #display_board
class GameBoard
  attr_accessor :board

  def initialize
    @board = [
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"],
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"],
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"],
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"],
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"],
      ["\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8", "\u26C8"]
    ]
  end

  def apply_change(token, column, row = 5)
    if board[row][column - 1] != "\u26C8"
      apply_change(token, column, row - 1)
    else
      board[row][column - 1] = token
    end
  end

  def display_board
    puts ''
    board.each do |arr|
      arr.each { |item| print "#{item} " }
      puts ''
    end

    puts ''
  end

  def available_space?
    board.any? { |arr| arr.any? { |item| item == "\u26C8" } }
  end
end
