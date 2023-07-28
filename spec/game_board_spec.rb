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

  describe '#available_space?' do
    context 'when there is availbale space' do
      it 'returns true' do
        expect(game_board.available_space?).to eq(true)
      end
    end

    context 'when there is no availbale space' do
      it "doesn't return true" do
        allow(game_board).to receive(:available_space?).and_return(false)
        expect(game_board.available_space?).not_to eq(true)
      end
    end
  end
end
