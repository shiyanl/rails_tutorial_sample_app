class UsersController < ApplicationController
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
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
