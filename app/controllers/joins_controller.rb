class JoinsController < ApplicationController
  def new
    @join = Join.new
  end

  def create
    @join = current_user.joins.build(join_params)

    if @join.save
      redirect_to root_path, notice: "You've joined the lobby!"
    else
      render :new
    end
  end

  def index
    if params[:user_id].present?
      @joins = User.find(params[:user_id]).joins
    else
      @joins = Join.all
    end
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) # if session[:user_id].present?
  # end
  # helper_method :current_user

  private

  def join_params
    params.require(:join).permit(:game)
  end
end
