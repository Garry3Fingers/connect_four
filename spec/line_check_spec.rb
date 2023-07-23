# frozen_string_literal: true

require_relative '../lib/line_check'

describe LineCheck do
  describe '#check' do
    before(:each) do
      @token = 'V'
    end

    context 'when it has a vertical line of four identical tokens' do
      board = [
        ["\u2609", "\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', 'V', "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", 'V', "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"],
        ["\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609", "\u2609"]
      ]

      subject(:line_check) { described_class.new(board) }

      it 'return true' do
        expect(line_check.check(@token)).to eq(true)
      end
    end
  end
end
