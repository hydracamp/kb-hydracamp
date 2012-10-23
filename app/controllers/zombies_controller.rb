class ZombiesController < ApplicationController
  def new
    @zombie = Zombie.new
  end

  def create
    @zombie = Zombie.create(params[:zombie])
    redirect_to zombies_path, :notice=> "Added Zombie"
  end
  
  def update
	@zombie = Zombie.update(params[:id], params[:zombie])
    redirect_to zombies_path, :notice=> "Updated zombie " + @zombie.name
  end
  
  def edit
    @zombie = Zombie.find(params[:id])
  end

  
  def index
    @zombies = Zombie.order(:name)
  end
end
