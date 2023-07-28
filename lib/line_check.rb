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
    return true if vertical_check(token) || horizontal_check(token) || diagonal_check(token)

    false
  end

  private

  def diagonal_left(token, row, element)
    i = row
    j = element
    count = 0
    while i <= 5 && count < 4
      break unless game_board[i][j] == token

      i += 1
      j -= 1
      count += 1
    end

    count
  end

  def diagonal_right(token, row, element)
    i = row
    j = element
    count = 0
    while i <= 5 && count < 4
      break unless game_board[i][j] == token

      i += 1
      j += 1
      count += 1
    end

    count
  end

  def diagonal_check(token)
    diagonals = find_each_index(token)

    diagonals.each do |row, column|
      next if column.empty?

      column.each do |element|
        return true if diagonal_left(token, row, element) == 4
        return true if diagonal_right(token, row, element) == 4
      end
    end

    false
  end

  def horizontal_check(token)
    rows_with_token = find_each_index(token)

    rows_with_token.each do |_row, arr|
      next unless arr.size == 4

      return true if arr.each_cons(2).all? { |x, y| y == x + 1 }
    end

    false
  end

  def column_check(element, rows, row)
    i = row
    count = 0
    while i <= 5 && count < 4
      break unless rows[i].include?(element)

      count += 1
      i += 1
    end

    count
  end

  def vertical_check(token)
    rows_with_columns = find_each_index(token)

    rows_with_columns.each do |row, column|
      next if column.empty?

      column.each do |element|
        count = column_check(element, rows_with_columns, row)
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
