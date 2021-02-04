class HeroesController < ApplicationController
  def  index
    @heros = Hero.all
  end

  def p_c_index
    @hero = Hero.find(params[:id])
  end

  def new
  end

  def create
    hero = Hero.new({
     name: params[:hero][:name],
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
    hero = Hero.find(params[:id])
    hero.update({
    name: params[:hero][:name],
    alive: params[:hero][:alive],
    updated_at: Time.now
    })
  hero.save
  redirect_to "/heroes/#{hero.id}"
  end

  def destroy
  Hero.destroy(params[:id])
  redirect_to '/heroes'
  end
end
