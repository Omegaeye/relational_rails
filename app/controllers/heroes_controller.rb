class HeroesController < ApplicationController
  def  index
    if params[:sort]
      @heros = Hero.number_of_mounts
    elsif params[:name]
      @heros = Hero.name_search(params[:name]).sorted_by_created_at
    else
      @heros = Hero.sorted_by_created_at
    end
  end

  def p_c_index
    if params[:sort]
      @hero = Hero.find(params[:id])
      @mounts = @hero.mounts.sorted
    elsif params[:level]
      @hero = Hero.find(params[:id])
      @mounts = @hero.mounts.level_above(params[:level])
    else
      @hero = Hero.find(params[:id])
      @mounts = @hero.mounts.fly
    end
  end

  def new
    @hero = Hero.new
  end

  def create
    hero = Hero.new({
    name: params[:name].capitalize,
    alive: true,
    level: 1,
    created_at: Time.now,
    updated_at: Time.now
    })

   hero.save

   redirect_to '/heroes'
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def edit
    @hero = Hero.find(params[:id])
  end

  def update
    @hero = Hero.find(params[:id])
    @hero.update({
    name: params[:name].capitalize,
    alive: params[:alive],
    level: params[:level],
    updated_at: Time.now
    })
  @hero.save
  redirect_to "/heroes/#{@hero.id}"
  end

  def destroy
  Hero.destroy(params[:id])
  redirect_to '/heroes'
  end
end
