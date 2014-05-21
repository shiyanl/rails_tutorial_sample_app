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
  

end
