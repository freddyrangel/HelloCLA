class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user && @user.persisted?
      sign_in @user
      redirect_to new_agreement_path
    else
      redirect_to root_path, notice: 'Login failed.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
