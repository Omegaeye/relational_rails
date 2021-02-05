class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def p_c_index
    @team = Team.find(params[:id])
  end

  def over_age
    binding.pry
    @team = Team.find(params[:id]).players.over_age(params[:age])
    redirect_to "teams/#{@teams.id}/players"
  end

  def show
    @team = Team.find(params[:id])
  end

  def new

  end

  def edit
    @team = Team.find(params[:id])
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to '/teams'
  end

  def update
    team = Team.find(params[:id])
    team.update({
      name: params[:team][:name],
      city: params[:team][:city],
      updated_at: Time.now
      })
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def create
    team = Team.new({
      name: params[:team][:name],
      city: params[:team][:city],
      rank: Team.all.count + 1,
      first_place: false,
      created_at: Time.now,
      updated_at: Time.now
      })
    team.save
    redirect_to '/teams'
  end
end
