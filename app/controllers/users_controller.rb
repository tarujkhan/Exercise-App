class UsersController < ApplicationController

    get '/register' do 
    if !session[:user_id]
        erb :'create_user'
    else 
        redirect to '/work_outs' 
end
end

    post '/register' do
@user = User.new(params)
