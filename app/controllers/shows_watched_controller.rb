class ShowsWatchedController < ApplicationController

  # GET: /shows_watched
  get "/shows" do
   erb :"shows/show.html" 
  end


  get '/shows/new' do
    #checks
    if !logged_in?
      redirect '/login'
    else
      
      erb :"shows/new.html" 
    end
  end


  # get '/shows/:id/edit' do
  #    #checks
  #     if !logged_in?
  #       redirect '/login'
  #     else
  #     if show = current_user.shows.find(params[:title])≈
  #       "Edit the show you watched" 
  #     else
  #       redirect '/shows'
  #     end
  #     end
  #   end
end

