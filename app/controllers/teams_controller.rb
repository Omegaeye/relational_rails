class TeamsController < ApplicationController
  def index
    if params[:sort]
      @teams = Team.number_of_players
    elsif params[:name]
      @teams = Team.name_search(params[:name])
    else
      @teams = Team.sort
    end
  end

  def p_c_index
    if params[:sort]
      @team = Team.find(params[:id])
      @players = @team.players.sorted
    elsif params[:age_of]
      @team = Team.find(params[:id])
      @players = @team.players.over_age(params[:age_of])
    else
      @team = Team.find(params[:id])
      @players = @team.players
    end
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
      name: params[:team][:name].capitalize,
      city: params[:team][:city].capitalize,
      updated_at: Time.now
      })
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def create
    team = Team.new({
      name: params[:team][:name].capitalize,
      city: params[:team][:city].capitalize,
      rank: Team.all.count + 1,
      first_place: false,
      created_at: Time.now,
      updated_at: Time.now
      })
    team.save
    redirect_to '/teams'
  end
end
