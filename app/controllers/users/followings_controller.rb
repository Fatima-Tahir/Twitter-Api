module ::Users
  class FollowingsController < ApplicationController
    def create
      current_user.follow(user)
      render json: current_user.followees.distinct
    end
  
    def destroy
      current_user.unfollow(user)
      render json: current_user.followees.distinct
    end
  
    private
      def current_user
        @current_user = TwitterUser.find_by!(id: params[:id]) 
      end
  
      def user
        @user = TwitterUser.find(params[:user])
      end
  end
end