class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
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
    if params[:app_ids]
      @apps = App.find(params[:app_ids])
      @user.apps.each { |app| @user.remove_app(app.name) unless @apps.include?(app) }
      @apps.each { |app| @user.add_app(app.name) unless @user.apps.include?(app) }
    else
      @user.apps.destroy_all
    end
    redirect_to '/', notice: 'Apps were successfully updated.'
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
