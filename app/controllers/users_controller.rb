require 'pry'
class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end


  end


  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:nausea,:password,:happiness,:tickets,:height, :admin)
  end



end
