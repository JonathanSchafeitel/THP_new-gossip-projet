class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(mail: params[:mail])
      puts "%" * 60
      puts user
      puts params[:mail]
      puts params[:password]
      puts "%" * 60

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "%" * 60
      puts session[:user_id]
      puts "%" * 60
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to "/sessions/new"
  end
end
