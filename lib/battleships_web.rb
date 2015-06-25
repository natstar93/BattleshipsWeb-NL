require 'sinatra/base'
require 'battleships'
#require 'ship'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/Start' do

    erb :start
  end

  get '/Welcome' do
    @name = params[:name]
    erb :welcome
  end

  get '/New_Game' do
    $game = Game.new Player, Board
    @name = params[:name]
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
    erb :gameplay
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
