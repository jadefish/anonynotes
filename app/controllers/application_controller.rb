class ApplicationController < ActionController::Base
  private

  around_action :catch_and_abort

  def respond_with(result)
    result
      .and_then { |data| redirect_to(data) }
      .or_else { |err| render_error(err) }
  end

  def catch_and_abort
    catch :abort do
      yield
    end
  end

  def render_error(err)
    return unless err

    respond_to do |fmt|
      fmt.html { render html: err, status: 500 }
      fmt.json { render json: { errors: [err] }, status: 500 }
      fmt.text { render plain: err, status: 500 }
      fmt.any { head 500 }
    end

    throw :abort # halt execution, preventing double renders.
  end
end
