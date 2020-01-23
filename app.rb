require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'
require_relative './database_connection_setup'

require_relative './lib/users'

class MakersBnB < Sinatra::Base
enable :sessions

  get '/' do
    'Hello World!'
  end

  get '/space/new' do
    erb :"space/new"
  end

  post '/space' do
    Space.create(name: params[:name], description: params[:description],
    price: params[:price], available_from: params[:available_from],
    available_to: params[:available_to])
    redirect '/space'
  end

  get '/space' do
    @user = User.find(id: session[:user_id])
    @spaces = Space.all
    erb :"space/index"
  end

  get '/space/:id' do
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

  post '/space/request' do
    renter = session[:user_id]
    space_id = params[:id]
    Booking.create(start_date: params[:start_date], end_date: params[:end_date], renter, space_id)

  end

  run! if app_file == $0
end
