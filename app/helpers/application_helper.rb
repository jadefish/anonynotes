module ApplicationHelper
  # title defines content for :title within a view.
  def title(t)
    content_for(:title) { t + ' - ' }
  end

  # hashed_ip returns a hexadecimal-encoded hash of the IP address of the
  # current request.
  def hashed_ip
    return HMAC.instance.hash request.remote_ip
  end
end
