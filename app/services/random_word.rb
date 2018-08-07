require 'singleton'
require 'spicy-proton'

class RandomWord
  include Singleton

  MIN_WORD_LENGTH = 4.freeze
  MAX_WORD_LENGTH = 8.freeze

  def initialize
    @gen = Spicy::Proton.new
  end

  def word(type, **options)
    if @gen.respond_to? type
      return @gen.public_send(type, **options)
    end

    return ''
  end

  def format(format)
    return @gen.format(format)
  end
end
