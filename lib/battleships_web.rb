require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
set :views, Proc.new { File.join(root, "..", "views") }

  @@game = Game.new Player, Board
  @board = @@game.own_board_view @@game.player_1

  get '/' do
    erb :index
  end

  get '/game/new' do
    erb :new_game
  end

  post '/game' do
    @name = params[:name]
    @board = @@game.own_board_view @@game.player_1
    if @name.empty?
      redirect '/game/new'
    else
      erb :start_game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
