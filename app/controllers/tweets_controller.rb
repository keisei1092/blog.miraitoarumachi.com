class TweetsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_tweet, only: [:show, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.reverse_order
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweets = Twee.all.reverse_order
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new
    @tweet.content = params[:content]
    @tweets = Tweet.all.reverse_order

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to index, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
