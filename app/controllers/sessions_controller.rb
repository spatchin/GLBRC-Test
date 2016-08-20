class SessionsController < ApplicationController
  def new
  end

 	def create
    @user = User.find_by_login(params[:session][:login])
    if @user && @user.authenticate(params[:session][:password])
    	session[:user_id] = @user.id
      redirect_to '/'
    else
    	flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to '/'
  end
end
