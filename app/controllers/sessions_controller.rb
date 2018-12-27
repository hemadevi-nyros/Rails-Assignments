class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to articles_url
    else
      redirect_to log_in_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_url, :notice => "Logged out!"
  end
end
