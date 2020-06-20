require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #skip_before_action :authorized, only: [:new, :create, :welcome, :show]

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user 
      @current_user ||= User.find(session[:user_id])
    end 


    def logged_in?
    !!session[:user_id]
    end
  end 

  def redirect_if_not_logged_in
    if !logged_in?     
    
      redirect to '/login'
    end 
  end
end