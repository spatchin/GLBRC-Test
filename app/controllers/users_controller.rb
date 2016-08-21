class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @apps = App.all
  end

  def create
    @user = User.new(user_params)
    @user.add_default_apps
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    # Update user's apps
    @apps = App.find(params[:app_ids])
    @user.apps.destroy_all
    @apps.each { |app| @user.add_app(app.name) }

    redirect_to apps_path, notice: 'User was successfully updated.'
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, app_ids: [])
    end
end
