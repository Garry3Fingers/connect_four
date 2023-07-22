# frozen_string_literal: true

# This class implements the playing field for the game.
# It has public interfaces #apply_change and #display_board
class GameBoard
  attr_accessor :board

  def initialize
    @board = [
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
      ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"]
    ]
  end

  def apply_change(token, column, row = 5)
    if board[row][column - 1] != "\u2609"
      apply_change(token, column, row - 1)
    else
      board[row][column - 1] = token
    end
  end

  def display_board
    puts ''
    puts '1 2 3 4 5 6 7'

    board.each do |arr|
      arr.each { |item| print "#{item} " }
      puts ''
    end

    puts ''
  end
end
