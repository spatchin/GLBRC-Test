class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(current_user.id) if current_user
    @shapes = { 'Red' => 'star', 'Blue' => 'heart',
                'Yellow' => 'triangle-top', 'Green' => 'stop',
                'Purple' => 'ok' }
    if @user
      @apps = @user.apps.all
    else
      @apps = []
      App.all.each { |app| @apps << app if app.status == true }
    end
  end

  def show
  end

  def new
    @app = App.new
  end

  def edit
  end

  def create
    @app = App.new(app_params)

    if @app.save
      redirect_to @app, notice: 'App was successfully created.'
    else
      render :new
    end
  end

  def update
    if @app.update(app_params)
      redirect_to @app, notice: 'App was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @app.destroy
    redirect_to apps_url, notice: 'App was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :description, :color, :status)
    end
end
