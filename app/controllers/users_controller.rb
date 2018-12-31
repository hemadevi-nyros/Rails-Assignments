class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only:[:new, :create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) 
  end 
  
  def create
    @user = User.new(user_params)
    # binding.pry
    if  @user.save
      redirect_to log_in_url, notice: 'Successfully created' 
    else
      render :new
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email,:password_digest, :password, :password_confirmation, :name)
  end
end
