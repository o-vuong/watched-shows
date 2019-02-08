class ShowsWatchedController < ApplicationController
  
  get "/shows" do
    check
     @shows = Show.all
     erb :"/shows/index.html"
  end

  post "/shows" do
    check
     @show = Show.create(params)
     @show.valid?
     if @show.errors[:title]
      erb :"/shows/show_error.html"
     else 
      redirect "/shows"
     end
  end 
  

  get "/shows/new" do
    check
      @user = current_user
      erb :"/shows/new.html"
  end

  get "/shows/:id" do 
    check
      @shows = Show.find_by_id(params[:id]) 
      @shows && @shows.user == current_user
      @error_message = params[:error]
      erb :"shows/show.html"
  end
      
  get "/shows/:id/edit" do
    check
      @shows = Show.find_by_id(params[:id]) 
      if @shows && @shows.user == current_user
        erb :"shows/edit.html"
      else
        redirect '/shows'
      end
  end

  patch "/shows/:id" do
   check
      @shows = Show.find(params[:id])
      @shows.update(params.select{|k|k=="title" || k=="date"})
      redirect "/shows"
  end

  patch "/shows/" do
    check
      @shows && @shows.user == current_user
      @shows = Show.find_by_id(params[:id])
      redirect "/shows/#{@shows.id}"
  end


  delete "/shows/:id/delete" do
    check
      @shows = Show.find_by_id(params[:id])
      if @shows && @shows.user == current_user
        @shows.destroy
      end
      redirect to "/shows"
  end
end