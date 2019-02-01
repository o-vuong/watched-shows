class ShowsWatchedController < ApplicationController
  
  # GET: /shows_watched
  get "/shows" do
    @shows= Show.all
   erb :'shows/shows.html'
  end


  get '/shows/new' do
    #checks
    if !logged_in?
      redirect '/login'
    else
      
      erb :"shows/new.html" 
    end
  end

  post '/shows' do
    unless Show.valid_params?(params[:id])
      redirect '/shows/new?error= fill out all information'
    end
     Show.create(params)
     redirect '/shows'
  end


  get '/shows/:id/edit' do
     @shows = Show.all
      if !logged_in?
        redirect '/login'
      else
      @shows = current_user.shows.find_by(params[:id])
          erb :'/shows/edit.html'
      end
    end
    
end

