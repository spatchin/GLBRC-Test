class UserAppsController < ApplicationController
  before_action :set_user_app, only: [:show, :edit, :update, :destroy]

  def index
    @user_apps = UserApp.all
  end

  def show
  end

  def new
    @user_app = UserApp.new
  end

  def edit
  end

  def create
    @user_app = UserApp.new(user_app_params)

    if @user_app.save
      redirect_to @user_app, notice: 'User app was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user_app.update(user_app_params)
      redirect_to @user_app, notice: 'User app was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user_app.destroy
    redirect_to user_apps_url, notice: 'User app was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_app
      @user_app = UserApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_app_params
      params.require(:user_app).permit(:name, :description, :user_id, :app_id)
    end
end
