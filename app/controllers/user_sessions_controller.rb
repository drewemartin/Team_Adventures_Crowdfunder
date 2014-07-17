class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:email])
  		redirect_back_or_to(:categories, notice: 'Login Successful')
  	else
  		flash.now[:alert] = 'login unsuccessful'
  		render action: 'new'
  	end
  end

  def destroy
  	logout
  	redirect_to(:categories, notice: 'logged out')
  end
end
