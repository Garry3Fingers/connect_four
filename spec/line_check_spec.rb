# frozen_string_literal: true

require_relative '../lib/line_check'

describe LineCheck do
  describe '#check' do
    before(:each) do
      @token = 'V'
      @token2 = 'A'
    end

    context 'when there is a vertical line of four identical tokens on the board' do
      board = [
        ["\u2609", "\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"]
      ]

      subject(:line_check) { described_class.new(board) }

      it 'returns true' do
        expect(line_check.check(@token)).to eq(true)
      end
    end

    context 'when there is a horizontal line of four identical tokens on the board' do
      board = [
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', 'V', 'V', 'V', "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"]
      ]

      subject(:line_check) { described_class.new(board) }

      it 'returns true' do
        expect(line_check.check(@token)).to eq(true)
      end
    end

    context 'when there is a diagonal line of four identical tokens on the board' do
      board = [
        %w[0 0 0 A 0 0 0],
        %w[0 0 0 V A 0 0],
        %w[0 0 V 0 0 A 0],
        %w[0 V 0 0 0 0 A],
        %w[V 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0]
      ]

      subject(:line_check) { described_class.new(board) }

      it 'returns true' do
        expect(line_check.check(@token)).to eq(true)
      end

      it 'returns true with diagonal in other direction' do
        expect(line_check.check(@token2)).to eq(true)
      end
    end
  end
end
