class MountsController < HeroesController
  def index
    @mounts = Mount.all
  end

  def new
  end

  def create
    mount = Mount.new({
     name: params[:mount][:name],
     heroes_id: 1,
     fly: false,
     level: 1,
     created_at: Time.now,
     updated_at: Time.now
     })

   mount.save

   redirect_to '/mounts'
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
