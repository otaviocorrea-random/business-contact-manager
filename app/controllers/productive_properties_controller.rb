class ProductivePropertiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_productive_property, only: %i[ show edit update destroy ]

  # GET /productive_properties or /productive_properties.json
  def index
    @productive_properties = ProductiveProperty.all
    set_filters
  end

  # GET /productive_properties/1 or /productive_properties/1.json
  def show
  end

  # GET /productive_properties/new
  def new
    @productive_property = ProductiveProperty.new
  end

  # GET /productive_properties/1/edit
  def edit
  end

  # POST /productive_properties or /productive_properties.json
  def create
    @productive_property = ProductiveProperty.new(productive_property_params)

    set_plant_species

    respond_to do |format|
      if @productive_property.save
        format.html { redirect_to productive_property_url(@productive_property), notice: "Productive property was successfully created." }
        format.json { render :show, status: :created, location: @productive_property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: {errors: @productive_property.errors.full_messages}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productive_properties/1 or /productive_properties/1.json
  def update
    set_plant_species
    respond_to do |format|
      if @productive_property.update(productive_property_params)
        format.html { redirect_to productive_property_url(@productive_property), notice: "Productive property was successfully updated." }
        format.json { render :show, status: :ok, location: @productive_property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: {errors: @productive_property.errors.full_messages}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productive_properties/1 or /productive_properties/1.json
  def destroy
    business_contact = @productive_property.business_contact
    @productive_property.destroy

    respond_to do |format|
      format.html { redirect_to business_contact, notice: "Productive property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productive_property
      @productive_property = ProductiveProperty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def productive_property_params
      params.require(:productive_property).permit(:business_contact_id, :name, :area, :space_between_rows, :space_between_rows_unit, :space_between_plants, :space_between_plants_unit, :plant_species_ids)
    end

    def set_filters
      @productive_properties = @productive_properties.where(business_contact_id: params[:business_contact_id]) if params[:business_contact_id].present?
    end

    def set_plant_species 
      if params[:productive_property].key?(:plant_specy_ids)
        plant_specy_ids = Array(params[:productive_property][:plant_specy_ids]).map(&:to_i).filter{|id| id > 0}
        @productive_property.plant_species = []
  
        plant_specy_ids.each do |id|
          @productive_property.plant_species << PlantSpecy.find(id)
        end
  
        productive_property_params.delete(:plant_specy_ids)
      end
        
      @productive_property.assign_attributes(productive_property_params)
    end
end
