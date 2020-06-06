        class WorkoutsController < ApplicationController

            get '/work_outs' do 
                if logged_in? 
                @workout = current_user.workouts
                erb :'/workou_ts/index'
            else 
                redirect to '/login'
                end
            end


             get '/work_outs/new' do 
                if logged_in?
                @current_user
                erb :'/workou_ts/newwork_out'
            else
                redirect to '/login'
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
                    redirect to '/login'
                end
            end

            get '/work_outs/:id' do 
                @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    erb :'/workou_ts/showwork_out' 
                else
                    redirect to '/login'
                    end
                end

            get '/work_outs/:id/edit' do
                @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                      @workout = Workout.find(params[:id])
                      @user = User.find(session[:user_id])
                      erb :'/workou_ts/editwork_out'
                  else
                    redirect to '/login'
                end
            end
                
                
            patch '/work_outs/:id' do
                    @workout = Workout.find(params[:id])
                    @workout.name = params[:name]
                    @workout.date = params[:date]
                    @workout.numberofreps = params[:numberofreps]
                    @workout.duration = params[:duration]
                
                    if !@workout.save
                    @errors = @workout.errors.full_messages
                    erb :'/workou_ts/editwork_out'
                    else
                    redirect to("/work_outs/#{@workout.id}")
                
                    end
                
                  end
                               
                
                  delete '/work_outs/:id/delete' do
                    @workout = Workout.find(params[:id])
                    if logged_in? && @workout.user == current_user
                    @workout.destroy
                    redirect to 'work_outs'
                   else
                   redirect to '/login'
                   end
                end

                get '/advice' do
                    erb :'/workou_ts/advice'
            end 
        end
    