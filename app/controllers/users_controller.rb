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
    category = Category.all
    array = []
    rankin = []
    @user.categories.each do |cat|
      array << cat.name
    end
    

    @category = array
    @rankin = rankin
  end

  def metrics
    @tak = Topsy.timeline
    tak = @tak.to_json
    @keys = Key.all

    @keys.each do |key|
      @num = tak.scan(key.name)
    end


    
    @num = @num.count
  end

end
