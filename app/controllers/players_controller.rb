class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new

  end

  def create
    player = Player.new({
      name: params[:player][:name],
      position: params[:player][:position],
      age: params[:player][:age],
      starter: false,
      created_at: Time.now,
      updated_at: Time.now,
      team_id: 1
      })
    player.save
    redirect_to '/players'
  end

  def update
    player = Player.find(params[:id])
    player.update({
      name: params[:player][:name],
      age: params[:player][:age],
      position: params[:player][:position],
      updated_at: Time.now
      })
    player.save
    redirect_to "/players/#{player.id}"
  end

  def destroy
    Player.destroy(params[:id])
    redirect_to '/players'
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end
end
