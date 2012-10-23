class ZombiesController < ApplicationController
  def new
    @zombie = Zombie.new
  end

  def create
    @zombie = Zombie.create(params[:zombie])
    redirect_to zombies_path, :notice=> "Added Zombie"
  end

  def index
    @zombies = Zombie.order(:name)
  end

  def destroy
   @zombie = Zombie.find(params[:id])
   name = @zombie.name
   @zombie.destroy
   redirect_to zombies_path, :notice=> "Deleted Zombie '" + name + "'"
  end
end
