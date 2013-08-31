module LoginHelper
  def login_as(user)
    request.env["rack.session"]["user_id"] = user.id
  end
end
