class ApplicationController < ActionController::API
  respond_to :html, :json 
  protect_from_forgery with: :null

  before_action do
    user_email = params[:user_email].presence
    user = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      sign_in user, store: false
    end
  end

end
