module ApplicationHelper
  def avatar_url(user)
    if user.image
      "https://graph.facebook.com/#{user.uid}/picture?type=large"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end
  
  def stripe_express_path
    "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_C7ic7gFZUPyH0hAJn2rHoldumoclgT1i&scope=read_write"
  end
end