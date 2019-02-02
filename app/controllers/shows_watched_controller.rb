class ShowsWatchedController < ApplicationController
  
  get "/shows" do
    if !logged_in?
      redirect '/login'
    else
      @shows = current_user.show.build(params)
      @shows = Show.all
     
      erb :'/shows/index.html'
    end
  end


  get '/shows/new' do
    if !logged_in?
     redirect '/login'
    else
      
      erb :"/shows/new.html"    
    end
  end

  post "/shows" do
    if !logged_in?
      redirect '/login'
    else
      Show.create(params)
      redirect "/shows"
    end
  end
  

  get '/shows/:id/edit' do
    if logged_in?
      @error_message = params[:error]
      @shows = Show.find_by_id(params[:id]) 
      if @shows && @shows.user == current_user
         @error_message = params[:error]
        erb :'shows/edit.html'
      else
        redirect to '/shows'
      end
    else
      redirect to '/login'
    end
  end

  patch '/shows/:id' do
    @shows = Show.find_by_id(params[:id])
    unless Show.validators(params[:id])
      redirect "/shows/#{@shows.id}/edit?error=invalid show"
    end
    @shows.update(params.select{|k|k=="title" || k=="date" || k=="user_id"})
    redirect "/shows/#{@shows.id}"
  end

  get '/shows/:id/delete' do
    if logged_in?
      @shows = Show.find_by_id(params[:id])
      if @shows && @shows.user == current_user
      else
      redirect '/shows'
      end
    else
      redirect '/login'
    end
  end
  
  delete '/shows/:id' do
    if logged_in?
      @shows = Show.find_by_id(params[:id])
      if @shows && @shows.user == current_user
        binding.pry
        @shows.destroy(params[:id])
      end
      redirect to '/shows'
    else
      redirect to '/login'
    end
  end
    
end

