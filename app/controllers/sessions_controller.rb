class SessionsController < ApplicationController

  get '/login' do
    erb ':sessions/login.html'
  end

  post '/sessions' do
    sessions[:email] = params[:email]
    redirect '/shows'
end
