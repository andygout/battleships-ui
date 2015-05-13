require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
set :views, Proc.new { File.join(root, "..", "views") }

  @@game = Game.new Player, Board

  get '/' do
    erb :index
  end

  get '/game/register_players' do
    erb :register_players
  end

  post '/game' do
    $p1_name = params[:p1_name]
    $p2_name = params[:p2_name]
    if $p1_name.empty? && $p2_name.empty?
      redirect '/game/new'
    else
      @@game.player_1.place_ship Ship.destroyer, 'A1', :vertically
      @@game.player_2.place_ship Ship.destroyer, 'J1', :vertically
      @p1_board_own = @@game.own_board_view @@game.player_1
      @p1_board_opp = @@game.opponent_board_view @@game.player_1
      @p2_board_own = @@game.own_board_view @@game.player_2
      @p2_board_opp = @@game.opponent_board_view @@game.player_2
      erb :player_1_turn
    end
  end

  post '/game/player_1_turn' do
    @coord = params[:coord]
    @@game.player_2.shoot @coord.to_sym
    if !@@game.player_1.all_ships_sunk?
      @p1_board_own = @@game.own_board_view @@game.player_1
      @p1_board_opp = @@game.opponent_board_view @@game.player_1
      @p2_board_own = @@game.own_board_view @@game.player_2
      @p2_board_opp = @@game.opponent_board_view @@game.player_2
      erb :player_1_turn
    else
      @player_1_win_status = @@game.player_1.winner?
      @player_2_win_status = @@game.player_2.winner?
      erb :end_game
    end
  end

  post '/game/player_2_turn' do
    @coord = params[:coord]
    @@game.player_1.shoot @coord.to_sym
    if !@@game.player_2.all_ships_sunk?
      @p1_board_own = @@game.own_board_view @@game.player_1
      @p1_board_opp = @@game.opponent_board_view @@game.player_1
      @p2_board_own = @@game.own_board_view @@game.player_2
      @p2_board_opp = @@game.opponent_board_view @@game.player_2
      erb :player_2_turn
    else
      @player_1_win_status = @@game.player_1.winner?
      @player_2_win_status = @@game.player_2.winner?
      erb :end_game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
