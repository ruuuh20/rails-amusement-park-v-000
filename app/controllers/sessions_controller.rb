require 'pry'

class SessionsController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      # @user = User.new
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
