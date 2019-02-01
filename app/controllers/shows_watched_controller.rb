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
     Show.create(params)
      redirect '/shows'
   
  end


  get '/shows/:id/edit' do
     
      if !logged_in?
        redirect '/login'
      else
        
         @shows = Show.find(params[:id])
        
          erb :'/shows/edit.html'
        
        end
      end

  post "/shows/:id" do 
    if !logged_in?
      redirect '/login'
    else
      @shows = Show.find(params[:id])
      redirect "/shows/added"
    end
  end

  get "/show/added" do
    erb :"/shows/added_show"


  get '/shows/:id' do
    @shows = Show.find(params[:id])
    erb :"shows/shows.html"
  end

    
    
end

