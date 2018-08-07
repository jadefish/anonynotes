# frozen_string_literal: true

class HMAC
  include Singleton

  HASH_FUNCTION = 'sha256'

  def initialize
    @hmac = OpenSSL::Digest.new(HASH_FUNCTION)
  end

  # hash generates a hexadecimal-encoded string digest for `message`.
  def hash(message)
    OpenSSL::HMAC.hexdigest(
      @hmac,
      Anonynotes::Application.credentials.secret_key_base,
      message
    )
  end
end
