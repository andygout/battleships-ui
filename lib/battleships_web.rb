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
    $name = params[:name]
    if $name.empty?
      redirect '/game/new'
    else
      @@game.player_1.place_ship Ship.battleship, 'A1', :vertically
      @board1 = @@game.own_board_view @@game.player_1
      @board2 = @@game.opponent_board_view @@game.player_2
      erb :start_game
    end
  end

  post '/fire' do
    @coord = params[:coord]
    @@game.player_2.shoot @coord.to_sym
    @board1 = @@game.own_board_view @@game.player_1
    @board2 = @@game.opponent_board_view @@game.player_2
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
