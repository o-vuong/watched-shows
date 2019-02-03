class ShowsWatchedController < ApplicationController
  
  get '/shows' do
    if logged_in?
     @shows = Show.all
     erb :'shows/index.html'
    else
      redirect '/login'
    end
  end

  post '/shows' do
    if !logged_in?
      redirect '/login'
    else
      Show.create(params)
      session[:user_id] = @user.id
      redirect '/shows'
    end
  end 
  

  get '/shows/new' do
    if !logged_in?
     redirect '/login'
    else
      
      erb :'/shows/new.html'    
    end
  end

  get '/shows/:id' do 
    if logged_in?
      @shows = Show.find_by_id(params[:user_id]) 
      if @shows && @shows.user == current_user
         @error_message = params[:error]
        erb :'shows/show.html'
      else
        redirect to '/shows'
      end
    end
  end
      
  get '/shows/:id/edit' do
    if logged_in?
      if @shows && @shows.user == current_user
        binding.pry
        @shows = Show.find_by_id(params[:user_id]) 
        erb :'shows/edit.html'
      else
        redirect to '/shows'
      end
    else
      redirect to '/login'
    end
  end

  post '/shows/:id' do
   if logged_in?
      @shows = Show.find(params[:id])
      unless Show.valid_params?(params)
        redirect '/bags/#{@shows.id}/edit?error=invalid golf shows'
      end
      @shows.update(params.select{|k|k=='title' || k=='date'})
      redirect '/bags/#{@shows.id}'
    end
  end

  patch '/shows/:id' do
    if logged_in?
      if @shows && @shows.user == current_user
      @shows = Show.find_by_id(params[:user_id])
      redirect '/shows/#{@shows.id}'
      end
    end
  end

  get '/shows/:id/delete' do
    if logged_in?
      if @shows && @shows.user == current_user
        binding.pry
        @shows = Show.find_by_id(params[:id]) 
        @show.destroy
      else
        redirect to '/shows'
      end
 
    end
  end


  delete '/shows/:id/delete' do
    if logged_in?
      @shows = Show.find_by_id(params[:user_id])
      if @shows && @shows.user == current_user
        binding.pry
        @shows.destroy(params[:user_id])
      end
      redirect to '/shows'
    else
      redirect to '/login'
    end
  end
    
end

