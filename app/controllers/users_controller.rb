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
      config.consumer_key       = 'bRrpyEa4UWmSC3lnawB0jA'
      config.consumer_secret    = 'esqmvAptNEw78JetXBlWVoElTUij9NygiiLdXXyPYk'
      config.oauth_token        = '811563078-WuNQ4o0OY00NhSIB7TdzeNEmfzJi9NbU20NS1Vma'
      config.oauth_token_secret = 'SV2sLPIWz123ISJaeanOvZVVWhcicgbhGNz9AXvQw'
      config.auth_method        = :oauth
    end

    client = TweetStream::Client.new(:username => 'jhon_ecg', :password => 'Botero89')
    client.on_timeline_status do |status|
      puts "timeline status"
      puts status.to_json
    end
    
    puts @tak

  end

end
