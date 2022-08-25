class BusinessContactsController < ApplicationController
  before_action :set_business_contact, only: %i[ show edit update destroy ]

  # GET /business_contacts or /business_contacts.json
  def index
    @business_contacts = BusinessContact.all
  end

  # GET /business_contacts/1 or /business_contacts/1.json
  def show
  end

  # GET /business_contacts/new
  def new
    @business_contact = BusinessContact.new
  end

  # GET /business_contacts/1/edit
  def edit
  end

  # POST /business_contacts or /business_contacts.json
  def create
    @business_contact = BusinessContact.new(business_contact_params)

    respond_to do |format|
      if @business_contact.save
        format.html { redirect_to business_contact_url(@business_contact), notice: "Business contact was successfully created." }
        format.json { render :show, status: :created, location: @business_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_contacts/1 or /business_contacts/1.json
  def update
    respond_to do |format|
      if @business_contact.update(business_contact_params)
        format.html { redirect_to business_contact_url(@business_contact), notice: "Business contact was successfully updated." }
        format.json { render :show, status: :ok, location: @business_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_contacts/1 or /business_contacts/1.json
  def destroy
    @business_contact.destroy

    respond_to do |format|
      format.html { redirect_to business_contacts_url, notice: "Business contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_contact
      @business_contact = BusinessContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_contact_params
      params.require(:business_contact).permit(:name, :kind, :email)
    end
end
