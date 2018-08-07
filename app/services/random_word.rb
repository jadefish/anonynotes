# frozen_string_literal: true

# RandomWord is a service capable of generating random words.
class RandomWord
  include Singleton

  MIN_WORD_LENGTH = 4
  MAX_WORD_LENGTH = 8

  def initialize
    @gen = Spicy::Proton.new
  end

  def word(type, **options)
    @gen.public_send(type, **options) if @gen.respond_to? type
    ''
  end

  def format(format)
    @gen.format(format)
  end
end
