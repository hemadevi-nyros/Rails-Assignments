class ApplicationController < ActionController::Base
 rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 before_action :authorize
 protect_from_forgery with: :exception
 helper_method :current_user
 
 protected
 
 def authorize
    unless User.find_by(id: session[:user_id])
     redirect_to log_in_url, alert: "Please Signin"
    end
 end

  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def record_not_found
      render plain: "404 Not Found", status: 404
  end
end

  