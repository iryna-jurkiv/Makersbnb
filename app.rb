require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'
require_relative './lib/users'
require_relative './lib/booking'
require_relative './database_connection_setup'


class MakersBnB < Sinatra::Base
enable :sessions

  get '/' do
    redirect '/space'
  end

  get '/space/new' do
    erb :"space/new"
  end

  post '/space' do
    user_id = session[:user_id]
    Space.create(name: params[:name], description: params[:description],
    price: params[:price], available_from: params[:available_from],
    available_to: params[:available_to], user_id: user_id)
    redirect '/space'
  end

  get '/space' do
    @user = User.find(id: session[:user_id])
    @spaces = Space.all
    erb :"space/index"
  end

  get '/space/:id' do
    session[:space_id] = params[:id]
    spaces = Space.all
    spaces.each do |space|
      if space.id == params[:id]
        @selected_space = space
      end
    end
    erb :"space/select"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/space'
  end
  
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/space'
  end

  post '/space/request' do
    renter = session[:user_id]
    space_id = params[:id]
    Booking.create(start_date: params[:start_date], end_date: params[:end_date], renter: renter, space_id: space_id)
  end

  post '/bookings/confirmation' do
    renter = session[:user_id]
    space_id = session[:space_id]
    Booking.create(start_date: params[:start_date], end_date: params[:end_date], renter: renter,space_id: space_id)
    redirect '/bookings/confirmation'
  end

  get '/bookings/confirmation' do
    erb :"bookings/confirmation"
  end

  run! if app_file == $0
end
