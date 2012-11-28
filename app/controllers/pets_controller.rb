class PetsController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    # get data on all pets
    @pets = Pet.all
    respond_with @pets

  end

  def show
    # get the data for this particular pet
    @pet = Pet.find(params[:id])
    # get the last 10 visits for this pet
    @recent_visits = @pet.visits.all
    respond_with @pet
  end

  def new
    @pet = Pet.new
    # visit = @pet.visits.build
    3.times do
      visit = @pet.visits.build
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(params[:pet])
    if @pet.save
      redirect_to @pet, :notice => "Successfully added #{@pet.name} as a PATS pet."
    else
      render :action => 'new'
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(params[:pet])
      redirect_to @pet, :notice => "Updated #{@pet.name}'s information"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_url, :notice => "Removed #{@pet.name} from the PATS system"
  end
end
