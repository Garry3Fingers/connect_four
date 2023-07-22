# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('Vlad', 'V') }

  before do
    allow(player).to receive(:puts)
  end

  describe '#input' do
    context 'when the input is valid (num from 1 to 7 inclusive)' do
      it "returns the player's input" do
        allow(player).to receive(:gets).and_return('7')
        expect(player.input).to be(7)
      end
    end

    context 'when the input is unvalid and then valid' do
      before(:each) do
        name = player.name
        @message = "Your input is wrong. #{name}, please enter the column number from 1 to 7 inclusive."
      end

      it 'outputs wrong input message once' do
        allow(player).to receive(:gets).and_return('dd', '3')
        expect(player).to receive(:puts).with(@message).once
        player.input
      end

      it 'outputs wrong input message twice' do
        allow(player).to receive(:gets).and_return('dd', '32', '6')
        expect(player).to receive(:puts).with(@message).twice
        player.input
      end

      it 'doesn\'t return invaid input' do
        allow(player).to receive(:gets).and_return('8', '1')
        expect(player.input).not_to be(8)
      end
    end
  end
end
