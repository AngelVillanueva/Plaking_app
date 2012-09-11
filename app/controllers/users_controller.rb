class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  
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
      sign_in(@user) unless signed_in?  # the unless case covers the Admin role ????
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
  
  private
  def signed_in_user
    flash[:error] = "Please, sign in"
    redirect_to signin_url unless signed_in?
  end
end