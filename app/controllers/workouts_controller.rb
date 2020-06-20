        class WorkoutsController < ApplicationController

            # http verbs 'the route' do 
            #     if logged_in? - to check if user is logged
            #         logic depending on the verb goes here
            #         the view erb related to that logic goes here 
            #     else 
            #         redirect to login page 
           #============================
            #show all user workouts on the index page including current user work outs
                #this particular thing is related to the index route showing all workouts

            #on the show page of each individual workouts only show edit and delete button for current user workouts
            #the show page for each work out that isn't created by current user does not have edit or delete actions
            #what condition can I write on the erb to only edit my workouts and not someone else's?
            #if this particular workout is not connected to the current user do not show edit or delete? otherwise show me.

            get '/work_outs' do 
                if logged_in? 
               @workout = current_user.workouts && Workout.all
               #@workouts = Workout.all
                erb :'/workou_ts/index'
            else 
                redirect_if_not_logged_in
                end
            end


             get '/work_outs/new' do 
                if logged_in?
                @current_user
                erb :'/workou_ts/newwork_out'
            else
                redirect_if_not_logged_in
                end
            end

             post '/work_outs' do 
                if logged_in?
                @workout = current_user.workouts.build(params)
                if !@workout.save
                @errors = @workout.errors.full_messages
                erb :'/workou_ts/newwork_out'
            else 
                redirect to '/work_outs'
                end
                 else
                    redirect_if_not_logged_in
                end
            end

            get '/work_outs/:id' do 
                @workout = Workout.find(params[:id])
                   if logged_in? && @workout.user_id == current_user.id 
                    erb :'/workou_ts/showwork_out' 
                else
                  redirect to '/login'
                    end
                end

            get '/work_outs/:id/edit' do
                @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                      #@workout = Workout.find(params[:id])
                     # @user = User.find(session[:user_id])
                      erb :'/workou_ts/editwork_out'
                  else
                    redirect_if_not_logged_in
                end
            end
                
                
            patch '/work_outs/:id' do
                # if current_user.id == workouts.user_id
                #     @workout = Workout.find(params[:id])
                #     @errors

                #    erb: '/workou_ts/editwork_out.erb' 
                # else 
                    
                #     redirect to :'/index'
                @workout = Workout.find(params[:id])
                if logged_in? && @workout.user == current_user
                 
                    @workout = Workout.find(params[:id])
                    @workout.name = params[:name]
                    @workout.date = params[:date]
                    @workout.numberofreps = params[:numberofreps]
                    @workout.duration = params[:duration]
                    @workout.save
                    redirect to("/work_outs/#{@workout.id}")
                 else 
                     @errors = @workout.errors.full_messages
                     erb :'/workou_ts/editwork_out'
            
                     end
                
                  end
                
                  delete '/work_outs/:id/delete' do
                    @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    @workout.destroy
                    redirect to 'work_outs'
                   else
                    redirect_if_not_logged_in
                   end
                end

                get '/advice' do
                    erb :'/workou_ts/advice'
            end 

                get '/homepage' do
                    
                    if logged_in?
                        @user = User.find_by(user_name: params[:user_name])
                    @workouts = Workout.all
                    erb :'/workou_ts/homepage'
                    else 
                        redirect_if_not_logged_in
        end
    end 
end
