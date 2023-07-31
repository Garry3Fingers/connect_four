# frozen_string_literal: true

require_relative '../start_game'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/game_board'
require_relative '../lib/line_check'

describe StartGame do
  describe '#self.ask_names' do
    before do
      allow(StartGame).to receive(:puts)
    end

    context 'when there are different names' do
      it 'returns hash with names' do
        allow(StartGame).to receive(:gets).and_return('Vlad', 'Alina')
        expect(StartGame.ask_names).to eq({ first_name: 'Vlad', second_name: 'Alina' })
      end
    end

    context 'when there is the same second name' do
      it 'shows the message' do
        allow(StartGame).to receive(:gets).and_return('Vlad', 'Vlad', 'Alina')
        message = 'Enter another name'
        expect(StartGame).to receive(:puts).with(message).once
        StartGame.ask_names
      end
    end
  end
end
