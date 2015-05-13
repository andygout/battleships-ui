require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/game/new' do
    erb :new_game
  end

  get '/game' do
    @name = params[:name]
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
