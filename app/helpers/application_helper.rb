module ApplicationHelper
  # title defines content for :title within a view.
  def title(title)
    content_for(:title) { title + ' - ' }
  end

  # hashed_ip returns a hexadecimal-encoded hash of the IP address of the
  # current request.
  def hashed_ip
    HMAC.instance.hash request.remote_ip
  end

  def heart
    "\u2764\ufe0f".encode('utf-8')
  end
end
