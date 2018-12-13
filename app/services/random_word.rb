# frozen_string_literal: true

# RandomWord is a service capable of generating random words.
class RandomWord
  include Singleton

  MIN_WORD_LENGTH = 4
  MAX_WORD_LENGTH = 8

  def initialize
    @gen = Spicy::Proton.new
  end

  # word generates a random word of the provided type.
  # Supported types are: adjective, adverb, noun, verb.
  def word(type, *args)
    @gen.public_send(type, *args)
  end

  def pair
    @gen.pair
  end

  def format(format)
    @gen.format(format)
  end
end
