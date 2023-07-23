# frozen_string_literal: true

# This class implements a check for a horizontal, vertical,
# or diagonal line of four identical tokens.
# It has a public interface #check
class LineCheck
  attr_reader :game_board

  def initialize(game_board)
    @game_board = game_board
  end

  def check(token)
    vertical_check(token)
  end

  private

  def vertical_check(token)
    rows_woth_columns = find_each_index(token)
    rows_woth_columns.each do |row, column|
      next if column.empty?

      column.each do |element|
        i = row
        count = 0
        while i <= 5 && count < 4
          break unless rows_woth_columns[i].include?(element)

          count += 1
          i += 1
        end

        return true if count == 4
      end
    end

    false
  end

  def find_each_index(token)
    each_ind = { 0 => [], 1 => [], 2 => [], 3 => [], 4 => [], 5 => [] }

    game_board.each_with_index do |arr, i|
      if arr.include?(token)
        arr.each_index { |index| each_ind[i] << index if arr[index] == token }
      end
    end

    each_ind
  end
end
