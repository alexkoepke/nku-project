class CommunitiesController < ApplicationController
  
  def index
    @communities = Community.all
  end

  def new
    @communities = Community.new
  end
  
  def create
    @communities = Community.new(params[:community].permit(:community_name, :community_description))
    if @communities.save
      session[:community_id] = @communities.id
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def edit
    @communities = current_community
  end

  def update
    current_community.update_attributes!(community_params)
    redirect_to root_path, notice: "Successfully updated your community"
  end

  def show
    @communities = Community.find(params[:id])
  end

  def current_community
    @current_community ||= Community.find_by(id: session[:community_id]) # if session[:community_id].present?
  end
  helper_method :current_community
  

  private
	
  def community_params
    	params.require(:community).permit(:community_name, :community_description)
  end


end