class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end
  def new
    @user = User.new
  end

  def create
    users_params = params.require(:user).permit(:mail,:age,:description, :city_id, :first_name,:last_name, :password, :password_confirmation)
    @user = User.new(users_params)

    if @user.save
      flash[:success] = "Tu es bien inscrit."
      redirect_to users_path(@user.id)
    else
      flash[:success] = "Une erreur est survenu"
      puts @user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
def authenticate_user
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  end
end