class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.build(player_params)

    if @player.save
      redirect_to players_path, notice: "You've joined the lobby!"
    else
      render :new
    end
  end

  def index

    if params[:user_id]
      @players = User.find(params[:user_id]).players
    else
      @players = Player.all(:order => "created_at DESC")
    end
  end

  def destroy
    @player = current_user.players
    @player.destroy_all

    redirect_to players_path, notice: 'You are no longer playing'
  end


  # def current_player
  #    @current_player ||= Player.find_by(id:) if session[:user_id].present?
  # end
  # helper_method :current_player

  private

  def player_params
    params.require(:player).permit(:game)
  end
end
