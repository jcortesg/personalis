require 'topsy'
require 'tweetstream'


class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def profile
    @user = current_user
  end

  def metrics
    
    TweetStream.configure do |config|
      config.consumer_key       = '9DBPgEAtUIFra0pBhcTlg'
      config.consumer_secret    = 'yQ9HD71nU0VlC2pKVxo3zIt6J5BjLoGBIUsxzYOq04'
      config.oauth_token        = '54296117-CnKVwHHQiAmYXQ0nnnR2LRh2bPsbXYdx7AUxKPXmc'
      config.oauth_token_secret = 'pYq8FAo3DvRwVD0xHG0JlTzJ2pJmUg029PLwT9QQ'
      config.auth_method        = :oauth
    end

    @statuses = []
    client = TweetStream::Client.new

    
     @j =client.track('intridea')
    
    @tak = Topsy.timeline
   
    tak = "esto tiene tweet"
    @num = tak.scan("tweet")
    @num = @num.count
  end

end
