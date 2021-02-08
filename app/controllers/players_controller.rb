class PlayersController < ApplicationController
  def index
    if params[:name]
      @players = Player.name_search(params[:name])
    else
      @players = Player.starters
    end
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:id])
    player = Player.new({
      name: params[:player][:name].capitalize,
      position: params[:player][:position],
      age: params[:player][:age],
      starter: true,
      created_at: Time.now,
      updated_at: Time.now,
      team_id: @team.id
      })
    player.save
    redirect_to "/teams/#{@team.id}/players"
  end

  def update
    player = Player.find(params[:id])
    player.update({
      name: params[:player][:name].capitalize,
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
