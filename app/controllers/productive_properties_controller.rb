class ProductivePropertiesController < ApplicationController
  before_action :set_productive_property, only: %i[ show edit update destroy ]

  # GET /productive_properties or /productive_properties.json
  def index
    @productive_properties = ProductiveProperty.all
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

    respond_to do |format|
      if @productive_property.save
        format.html { redirect_to productive_property_url(@productive_property), notice: "Productive property was successfully created." }
        format.json { render :show, status: :created, location: @productive_property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @productive_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productive_properties/1 or /productive_properties/1.json
  def update
    respond_to do |format|
      if @productive_property.update(productive_property_params)
        format.html { redirect_to productive_property_url(@productive_property), notice: "Productive property was successfully updated." }
        format.json { render :show, status: :ok, location: @productive_property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @productive_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productive_properties/1 or /productive_properties/1.json
  def destroy
    @productive_property.destroy

    respond_to do |format|
      format.html { redirect_to productive_properties_url, notice: "Productive property was successfully destroyed." }
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
      params.require(:productive_property).permit(:name, :area, :space_between_rows, :space_between_rows_unit, :space_between_plants, :space_between_plants_unit)
    end
end
