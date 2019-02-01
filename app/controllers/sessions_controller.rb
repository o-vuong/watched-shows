class SessionsController < ApplicationController

  get '/login' do
    erb ':sessions/login.html'
  end

  post '/sessions' do
    login(params[:email])

    redirect '/shows'
  end

  get '/logout' do 
    session.clear
  end


end
