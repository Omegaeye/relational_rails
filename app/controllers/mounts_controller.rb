class MountsController < ApplicationController
  def index
    if params[:name]
      @mounts = Mount.name_search(params[:name])
    else
      @mounts = Mount.fly
    end
  end

  def new
    @hero = Hero.find(params[:id])
  end

  def create
    @hero = Hero.find(params[:id])
    mount = Mount.new({
     name: params[:name].capitalize,
     fly: true,
     level: 1,
     created_at: Time.now,
     updated_at: Time.now,
     hero_id: @hero.id
     })

   mount.save

   redirect_to "/heroes/#{@hero.id}/mounts"
  end

  def show
    @mount = Mount.find(params[:id])
  end

  def edit
    @mount = Mount.find(params[:id])
  end

  def update
    mount = Mount.find(params[:id])
    mount.update({
    name: params[:name].capitalize,
    fly: params[:fly],
    level: params[:level],
    updated_at: Time.now
    })
  mount.save
  redirect_to "/mounts/#{mount.id}"
  end

  def destroy
  Mount.destroy(params[:id])
  redirect_to '/mounts'
  end
end
