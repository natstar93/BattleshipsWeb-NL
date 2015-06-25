require 'sinatra/base'
require 'battleships'
#require 'ship'

class BattleshipsWeb < Sinatra::Base

  enable :sessions

  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/Start' do

    erb :start
  end

  get '/Welcome' do
    @name = params[:name]
    session[:name] = @name
    if $game
      session[:player] = 'player_2'
    else
      session[:player] = 'player_1'
    end
    erb :welcome
  end

  get '/New_Game' do
    $game = Game.new Player, Board
    @name = params[:name]
    p session[:player]
    erb :new_game
  end

  post '/New_Game' do
    @ship = params[:ship]
    @coordinates = params[:coordinates]
    @orientation = params[:orientation]
    content = $game.player_1.place_ship Ship.new(@ship), @coordinates, @orientation
    erb :new_game
  end

  post '/Gameplay' do
    @fire = params[:fire]
    if @fire
      $game.player_1.shoot @fire.to_sym
    end
    erb :gameplay
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
