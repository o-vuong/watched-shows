class ShowsWatchedController < ApplicationController
  get "/shows" do
    if logged_in?
      @shows = Show.all
      erb :'/shows/shows.html'
    else
      redirect '/login'
    end
  end


  get '/shows/new' do
    #checks
    if logged_in?
     redirect '/login'
    else
      erb :"/shows/new.html"    
    end
  end

  post '/shows' do
    if logged_in?
      if params[:title] == ""
        redirect to "/shows/new"
      else
        @shows = current_user.show.build(title: params[:title])
        if @shows.save
          redirect to "/shows/#{@shows.id}"
        else 
          redirect to "/shows/new"
        end 
      end
    else 
      redirect to '/login' 
    end
  end



  get '/shows/:id/edit' do
     @shows = Show.find_by_id(params[:id])
      if logged_in?
        redirect '/login'
      else
        if @shows && @shows.user == current_user
       else
        erb :'/shows/edit.html'
        end
      end
    end

  post "/shows/:id" do 
    if logged_in?
      redirect '/login'
    else
      if @shows && @shows.user == current_user
        if @shows.update(title: params[:title], date: params[:date])
          redirect "/shows/#{@shows.id}"
        else
          "/shows/#{@shows.id}/edit"
        end
      else
        redirect '/shows'
      end

    end
  end




  patch '/shows/:id' do
    if logged_in?
      if params[:title] == "" 
        redirect to "/shows/#{params[:id]}/edit"
      else
        @shows = Show.find_by_id(params[:id])
        if @shows && @shows.user == current_user
          if @shows.update(title: params[:title], date: params[:date])
            redirect to "/shows/#{@shows.id}"
          else 
            redirect to "/shows/#{@shows.id}/edit"
          end
        else 
          redirect to '/shows'
        end
      end
    else 
      redirect to '/login'
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








    
  delete '/shows/:id/delete' do
    if logged_in?
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

