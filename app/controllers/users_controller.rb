class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) # if session[:user_id].present?
  end
  helper_method :current_user
  


  private
	def user_params
    	params.require(:user).permit(:email, :password, :password_confirmation)
  	end

end
