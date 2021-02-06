class MountsController < ApplicationController
  def index
    if params[:sort]
      @mounts = Mount.order(name: params[:sort])
  else
      @mounts = Mount.all
    end
  end

  def new
    @hero = Hero.find(params[:id])
  end

  def create
    @hero = Hero.find(params[:id])
    mount = Mount.new({
     name: params[:mount][:name],
     fly: false,
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
    name: params[:mount][:name],
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
