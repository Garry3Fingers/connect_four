# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/game_board'
require_relative '../lib/line_check'

describe Game do
  subject(:game) { described_class.new(first_player, second_player, game_board, line_checker) }
  let(:first_player) { instance_double(Player, name: 'Vlad', token: 'V') }
  let(:second_player) { instance_double(Player, name: 'Alina', token: 'A') }
  let(:game_board) { instance_double(GameBoard) }
  let(:line_checker) { instance_double(LineCheck) }

  before do
    allow(game).to receive(:puts)
    allow(game).to receive(:verify_input).and_return(false)
    allow(game_board).to receive(:display_board)
    allow(first_player).to receive(:input)
    allow(second_player).to receive(:input)
    allow(game_board).to receive(:apply_change)
    allow(line_checker).to receive(:check)
  end

  describe '#play' do
    context 'when a player makes a move' do
      before do
        allow(first_player).to receive(:input).and_return(1)
        allow(game_board).to receive(:available_space?).and_return(true, false)
      end

      it 'sends input' do
        expect(first_player).to receive(:input)
        game.play
      end

      it 'sends apply_change' do
        expect(game_board).to receive(:apply_change).with('V', 1)
        game.play
      end

      it 'sends display_board' do
        expect(game_board).to receive(:display_board)
        game.play
      end

      it 'sends available_space?' do
        expect(game_board).to receive(:available_space?)
        game.play
      end

      it 'sends check' do
        expect(line_checker).to receive(:check)
        game.play
      end
    end

    context 'when there are no moves left' do
      before do
        allow(game_board).to receive(:available_space?).and_return(false)
      end

      it 'shows message a draw message' do
        message = "It's a draw. Thanks for playing!"
        expect(game).to receive(:puts).with(message)
        game.play
      end
    end

    context 'when one of the players won' do
      before do
        allow(game_board).to receive(:available_space?).and_return(true, true, true)
        allow(line_checker).to receive(:check).and_return(true)
      end

      it 'stop loop' do
        expect(game_board).to receive(:available_space?).once
        game.play
      end
    end
  end
end
