class CommunitiesController < ApplicationController
  
  def index
    @communities = Community.all
  end

  def new
    @communities = Community.new
  end
  
  def create
    @communities = Community.new(params[:community].permit(:name, :description))

    @communities.users << current_user


    if @communities.save
      session[:community_id] = @communities.id
      redirect_to communities_path, notice: "Community Created!"
    else
      render "new"
    end
  end

  def edit
    @communities = Community.find(params[:id])
  end

  def update
    current_community.update_attributes!(community_params)
    redirect_to root_path, notice: "Successfully updated your community"
  end

  def show
    @communities = Community.find(params[:id])

    if params[:user_id]
      @players = User.find(params[:user_id]).players
    else
      @players = Player.all(:order => "created_at DESC")
    end

  end

  def current_community
    @current_community = Community.find(params[:id])
  end
  #helper_method :current_community
  

  private
	
  def community_params
    	params.require(:community).permit(:name, :description)
  end


end