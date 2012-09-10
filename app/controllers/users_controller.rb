class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to @user, notice: "The new user was created successfully"
    else
      flash.now[:error] = "Error saving the user"
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      flash[:success] = "The User was updated successfully"
      sign_in(@user)
      redirect_to @user
    else
      flash.now[:error] = "Error saving the user"
      render 'edit'
    end
  end
end