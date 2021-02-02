class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show

  end

  def new

  end

  def create
    team = Team.new({
      name: params[:team][:name],
      city: params[:team][:city],
      rank: params[:team][:id],
      first_place: false,
      created_at: Time.now,
      updated_at: Time.now
      })
    team.save
    redirect_to '/teams'
  end
end
