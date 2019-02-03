class SessionsController < ApplicationController

  get "/login" do
    erb :"sessions/login.html"
  end

  post "/sessions" do
    login(params[:email], params[:password])
    # is it correct user
    # check  user with email
    # redir to /login if not
    redirect "/shows"
  end

  get "/logout" do 
    logout!
    redirect "/shows"
  end


end
