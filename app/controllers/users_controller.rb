class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id]) || User.find_by(auth_id: params[:id])
      raise "User not found" unless @user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.except(:id).require(:user).permit(:care_for, :email, :first_name, :last_name,
      :elder_first_name, :elder_last_name, :mobile, :auth_name, :email_verified, :registration_complete)
    end
end
