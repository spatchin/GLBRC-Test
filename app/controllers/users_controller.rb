class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @apps = App.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.add_default_apps
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render '/', status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])

    # Update user's apps
    @apps = App.find(params[:app_ids])
    @user.apps.destroy_all
    @apps.each { |app| @user.add_app(app.name) }

    redirect_to apps_path, notice: 'User was successfully updated.'
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
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
