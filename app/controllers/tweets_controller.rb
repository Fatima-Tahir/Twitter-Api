class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy, :like, :dislike]

  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  def show
    render json: @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @tweet.destroy
      render json: {message: 'Successfully Destroyed !'}
    else
      render json: @tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def like
    @tweet.liked_by current_user
    render json: { likes: @tweet.get_likes.size, dislikes: @tweet.get_dislikes.size } 
  end

  def dislike
    @tweet.disliked_by current_user
    render json:{ likes: @tweet.get_likes.size, dislikes: @tweet.get_dislikes.size } 
  end

  private
  
  def set_tweet
    @tweet = Tweet.find_by!(id: params[:id])
  end

  def tweet_params
    params.permit(:body, :twitter_user_id)
  end

  def current_user
    @current_user = TwitterUser.find_by(params[:current_user])
  end
end
