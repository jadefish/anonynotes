class UnwrapError < StandardError; end

def Ok(...)
  Result.ok(...)
end

def Err(...)
  Result.err(...)
end

class Result
  def self.ok(value)
    Ok.new(value)
  end

  def self.err(err)
    Err.new(err)
  end

  private

  module Mixin
    def unwrap
      case self
      when Ok
        @value
      when Err
        raise UnwrapError, 'Cannot unwrap an Err value'
      end
    end

    def unwrap_or(default)
      case self
      when Ok
        @value
      when Err
        default
      end
    end

    def unwrap_or_else
      case self
      when Ok
        @value
      when Err
        yield @err
      end
    end

    def and_then
      case self
      when Ok
        yield @value
      end
    end

    def or_else
      case self
      when Err
        yield @err
      end
    end
  end

  class Ok
    include Result::Mixin

    private

    def initialize(value)
      @value = value
    end
  end

  class Err
    include Result::Mixin

    private

    def initialize(err)
      @err = err
    end
  end
end
