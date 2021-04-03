class ApplicationController < ActionController::API
  def issue_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.secret_key_base, "HS256")
  end

  def current_user
    @user ||= User.find(user_id)
  end

  def token
    request.headers["Authorization"]
  end

  def decoded_token
    begin
      JWT.decode(token, Rails.application.secret_key_base, true, { :algorithm => "HS256" })
    rescue JWT::DecodeError
      [{ error: "Invalid token" }]
    end
  end

  def user_id
    decoded_token.first["user_id"]
  end

  def logged_in?
    !!current_user
  end
end
