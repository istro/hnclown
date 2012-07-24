class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    redirect_to links_path
  end

  def index

  end

  def show
    @user = User.find
  end
end
