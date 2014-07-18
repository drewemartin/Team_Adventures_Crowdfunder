class UsersController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to projects_path, notice: "Signed up!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(user_params)
    if @user.update_attribues
      redirect_to user_path(current_user.id), notice: 'your edits were'
    else
      render 'edit'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :biography, :phone, :username, :password, :password_confirmation)
  end
end
