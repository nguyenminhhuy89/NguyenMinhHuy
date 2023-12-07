class Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  def login
    user = User.find_by(email: params[:email])
    
    if user && user.valid_password?(params[:password])
      render json: { message: 'Login successful', user: user }, status: :ok
    else
      render json: { message: '12331321' }, status: :unauthorized
    end
  end
end
