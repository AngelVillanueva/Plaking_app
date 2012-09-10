class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	sign_in(user)
      redirect_to user, notice: "Welcome to the User area, #{user.name}"
    else
    	flash.now[:error] = "Username or Password information was wrong"
    	render 'new'
    end
  end
  def destroy
    sign_out
    redirect_to root_path
  end
end