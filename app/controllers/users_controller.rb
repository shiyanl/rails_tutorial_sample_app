class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]
  
  def new
  end


  # GET 'users/1'
  def show
  	@user = User.find(params[:id])
  end

  def index
  	
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #Note that we can omit the user_url in the redirect
      #, writing simply redirect_to @user to redirect to the user show page.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    # Before filters

    def signed_in_user

      unless signed_in?
        flash[:notice] = "Please sign in."
        redirect_to signin_url
      end
    end
end
