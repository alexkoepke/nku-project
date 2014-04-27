class CommunitiesController < ApplicationController
  
  def index
    @communities = Community.all
  end

  def new
    @communities = Community.new
  end
  
  def create
    @community = Community.new(params[:community].permit(:name, :description))

    @community.users << current_user


    if @community.save
      session[:community_id] = @community.id
      # @membership
      # @membership.update_attributes(mod: "true")
      redirect_to community_path(@community), notice: "Community Created!"
    else
      render "new"
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    current_community.update_attributes!(community_params)
    redirect_to community_path, notice: "Successfully updated your community"
  end

  def show
    @community = Community.find(params[:id])

    if params[:user_id]
      @players = User.find(params[:user_id]).players
    else
      @players = Player.all(:order => "created_at DESC")
    end

  end

  # def newplayer
  #   @player = Player.new
  # end

  def player
    @community = Community.find(params[:id])
    @player = current_user.players.build(community: @community)

    if @player.save
      redirect_to community_path(@player.community), notice: "You've joined the lobby!"
    else
      render :new
    end
  end

  # def current_community
  #   @current_community = Community.find(params[:id])
  # end
  #helper_method :current_community
  

  private
	
  def community_params
    	params.require(:community).permit!(:name, :description)
  end


end