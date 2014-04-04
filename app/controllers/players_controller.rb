class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.build(join_params)

    if @player.save
      redirect_to players_path, notice: "You've joined the lobby!"
    else
      render :new
    end
  end

  def index
    if params[:user_id].present?
      @players = User.find(params[:user_id]).players
    else
      @players = Player.all
    end
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) # if session[:user_id].present?
  # end
  # helper_method :current_user

  private

  def join_params
    params.require(:player).permit(:game)
  end
end
