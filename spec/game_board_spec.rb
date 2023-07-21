# frozen_string_literal: true

require_relative '../lib/game_board'

describe GameBoard do
  subject(:game_board) { described_class.new }

  describe '#apply_change' do
    context 'when the player made a move' do
      it 'adds the token to the board' do
        token = 'a'
        column = 4
        game_board.apply_change(token, column)
        expect(game_board.board[5][3]).to eq(token)
      end
    end
  end
end
