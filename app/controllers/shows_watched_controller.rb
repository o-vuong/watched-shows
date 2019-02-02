class ShowsWatchedController < ApplicationController
  
  # GET: /shows_watched
  get "/shows" do
    @shows= Show.all
    erb :'/shows/shows.html'
  end


  get '/shows/new' do
    #checks
    if !logged_in?
      redirect '/login'
    else
      
      erb :"/shows/new.html" 
    end
  end

  post '/shows' do
     Show.create(params)
      redirect '/shows'
   
  end


  get '/shows/:id/edit' do
     @shows = Show.find_by_id(params[:id])
      if !logged_in?
        redirect '/login'
      else
        if @shows && @shows.user == current_user
       else
        erb :'/shows/edit.html'
        end
      end
    end

  post "/shows/:id" do 
    if !logged_in?
      redirect '/login'
    else
      if @shows && @shows.user == current_user
        if @tweet.update(title: params[:title], date: params[:date])
          redirect "/shows/#{@shows.id}"
        else
          "/shows/#{@shows.id}/edit"
        end
      else
        redirect '/shows'
      end

    end
  end

  get '/shows/:id/edit' do
    if logged_in?
      @shows = Show.find_by_id(params[:id])
      if @shows && @shows.user == current_user
        erb :'shows/edit.html'
      else
        redirect to '/shows'
      end
    else
      redirect to '/login'
    end
  end

  get "/shows/added" do
    erb :"/shows/added_show"
  end


  get '/shows/:id' do
    
    @shows = Show.all()
   
    erb :"/shows/added_show.html"
  end

    
  delete '/shows/:id/delete' do
    if !logged_in?
      @shows = Show.find_by_id(params[:id])
      if @shows && @shows.user == current_user
        @shows.delete
      end
      redirect to '/shows'
    else
      redirect to '/login'
    end
  end
    
end

