module ::Users
  class TwitterUsersController < ApplicationController
    before_action :set_twitter_user, only: [:show, :update, :destroy, :followees, :followers, :tweets]
  
    def index
      @twitter_users = TwitterUser.all
  
      render json: @twitter_users
    end
  
    def show
      render json: @twitter_user
    end
  
    def create
      @twitter_user = TwitterUser.new(twitter_user_params)
  
      if @twitter_user.save
        render json: @twitter_user, status: :created, location: @twitter_user
      else
        render json: @twitter_user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @twitter_user.update(twitter_user_params)
        render json: @twitter_user
      else
        render json: @twitter_user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @twitter_user.destroy
        render json: 'Successfully Destroyed !'
      else
        render json: @twitter_user.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def tweets
      render json: @twitter_user.tweets
    end

    #GET /twitter_users/:id/followees
    def followees
      @twitter_users = @twitter_user.followees
      render json: @twitter_users
    end
  
    #GET /twitter_users/:id/followers
    def followers
      @twitter_users = @twitter_user.followers
      render json: @twitter_users
    end
  
    private
      def set_twitter_user
        @twitter_user = TwitterUser.find_by!(id: params[:id])
      end
  
      def twitter_user_params
        params.permit(:username, :email, :password)
      end
  end
end