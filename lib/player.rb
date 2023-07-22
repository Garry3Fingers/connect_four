# frozen_string_literal: true

# This class inplements the player's behavior
# It has a public interface #input
class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def input
    start_input_message

    loop do
      input = gets.chomp.to_i
      return input if (1..7).include?(input)

      wrong_input_message
    end
  end

  private

  def start_input_message
    puts "#{name} enter the column number from 1 to 7 inclusive."
  end

  def wrong_input_message
    puts "Your input is wrong. #{name}, please enter the column number from 1 to 7 inclusive."
  end
end
