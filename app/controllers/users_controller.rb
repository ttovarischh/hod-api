class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, include: [:games]
    end

    def show
        @user = User.find(params[:id])
        render json: @user, include: [:games]
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :jti, :username, :about, :sex, :show)
    end
end