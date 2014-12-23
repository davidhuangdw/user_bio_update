class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      user.refresh_token(:auth_token)
      session[:auth_token] = user.auth_token
      redirect_to user, notice:'Logged in successfully.'
    else
      flash.now[:error] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:auth_token] = nil
    redirect_to root_url, notice:'Logged out successfully.'
  end
end
