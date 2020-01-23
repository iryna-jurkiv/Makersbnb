require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'
require_relative './database_connection_setup'

class MakersBnB < Sinatra::Base

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

  run! if app_file == $0
end
