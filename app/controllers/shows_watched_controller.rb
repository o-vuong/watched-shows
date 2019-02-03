class ShowsWatchedController < ApplicationController
  
  get "/shows" do
    check
     @shows = Show.all
     erb :"/shows/index.html"
  end

  post "/shows" do
    check
      Show.create(params)
      redirect "/shows"
  end 
  

  get "/shows/new" do
    check
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
      @shows && @shows.user == current_user
      @shows = Show.find_by_id(params[:id]) 
      erb :"shows/edit.html"
  end

  post "/shows/:id" do
   check
      @shows = Show.find(params[:id])
      unless Show.valid_params?(params)
        redirect "/shows/#{@shows.id}/edit?error=invalid shows"
      end
      @shows.update(params.select{|k|k=="title" || k=="date"})
      redirect "/shows/#{@shows.id}"
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