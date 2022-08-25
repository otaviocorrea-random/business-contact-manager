class PlantSpeciesController < ApplicationController
  before_action :set_plant_specy, only: %i[ show edit update destroy ]

  # GET /plant_species or /plant_species.json
  def index
    @plant_species = PlantSpecy.all
  end

  # GET /plant_species/1 or /plant_species/1.json
  def show
  end

  # GET /plant_species/new
  def new
    @plant_specy = PlantSpecy.new
  end

  # GET /plant_species/1/edit
  def edit
  end

  # POST /plant_species or /plant_species.json
  def create
    @plant_specy = PlantSpecy.new(plant_specy_params)

    respond_to do |format|
      if @plant_specy.save
        format.html { redirect_to plant_specy_url(@plant_specy), notice: "Plant specy was successfully created." }
        format.json { render :show, status: :created, location: @plant_specy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plant_species/1 or /plant_species/1.json
  def update
    respond_to do |format|
      if @plant_specy.update(plant_specy_params)
        format.html { redirect_to plant_specy_url(@plant_specy), notice: "Plant specy was successfully updated." }
        format.json { render :show, status: :ok, location: @plant_specy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plant_species/1 or /plant_species/1.json
  def destroy
    @plant_specy.destroy

    respond_to do |format|
      format.html { redirect_to plant_species_url, notice: "Plant specy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant_specy
      @plant_specy = PlantSpecy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plant_specy_params
      params.require(:plant_specy).permit(:name)
    end
end
