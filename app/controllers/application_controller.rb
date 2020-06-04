require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

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

end