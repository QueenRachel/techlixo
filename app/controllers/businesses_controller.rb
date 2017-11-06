class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /businesses
  def index
    @businesses = if params[:term]
      Business.where('address_city ILIKE ?', "%#{params[:term]}%")
    else
      Business.all
    end
  end

  # GET /my_businesses
  def my_businesses
    @businesses = current_user.businesses
  end

  # GET /businesses/1
  def show
    @contact = Contact.new
    @business = Business.find(params[:id])
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)
    @business.user = current_user

    if @business.save
      redirect_to my_businesses_path, notice: 'Business was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      redirect_to my_businesses_path, notice: 'Business was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
    redirect_to my_businesses_path, notice: 'Business was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business
    @business = Business.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def business_params
    params.require(:business).permit(:fantasy_name, :cnpj, :email, :telephone,
      :address_street, :address_number, :address_complement, :address_neighborhood,
      :address_city, :address_state, :address_zipcode, :company_name, :website, :observation,
      :term
    )
  end
end
