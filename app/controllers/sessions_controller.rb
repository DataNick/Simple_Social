class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You are signed in!"
      log_in(user)
      redirect_to user
      # log in user and redirect to resource user/show
    else
      flash.now[:danger] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
