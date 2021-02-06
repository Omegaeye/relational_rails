class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def p_c_index
    @team = Team.find(params[:id])
    # if params[:sort]
    #   if params[:age_of]
    #     @team = Team.find(params[:id])
    #     @team.players.order(name: params[:sort]).over_age(params[:age_of].to_i)
    #   else
    #     @team = Team.find(params[:id])
    #     @team.players.order(name: params[:sort])
    #   end
    # else
    #   if params[:age_of]
    #     @team = Team.find(params[:id])
    #     @team.players.over_age(params[:age_of].to_i)
    #   else
    #     @team = Team.find(params[:id])
    #   end
    # end
  end

  def over_age
    @team = Team.find(params[:id])
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

  private
  def teams_params
    params.permit(:age)
  end
end
