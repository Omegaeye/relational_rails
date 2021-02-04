class TeamsPlayersController < ApplicationRecord
  def index
    @teams = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:id])
    player = Player.new({
      name: params[:player][:name],
      position: params[:player][:position],
      age: params[:player][:age],
      starter: false,
      created_at: Time.now,
      updated_at: Time.now,
      team_id: @teams.id
      })
    player.save
    redirect_to "/teams/#{@team.id}/players"
  end

end
