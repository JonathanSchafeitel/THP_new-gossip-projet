class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @gossips = Gossip.all
  end
  
  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to gossips_path
  end
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(gossip_params)
    if @gossip.save
      redirect_to gossips_path(@gossip.id)
    end
    
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end

private

def gossip_params
  params.require(:gossip).permit(:title, :content, :author)
end
def authenticate_user
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  end
end