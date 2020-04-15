require 'result'

module Interactor
  def call(...)
    begin
      super(...)
    rescue StandardError => err
      Err(err)
    end
  end

  def call!(...)
    super(...)
  end

  def fail(err)
    Err(err)
  end

  def success(data)
    Ok(data)
  end
end
