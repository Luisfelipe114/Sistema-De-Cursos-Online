class Sales::AddressesController < Sales::ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_seller

  # GET /sales/addresses or /sales/addresses.json
  def index
    @addresses = @seller.sales_addresses
  end

  # GET /sales/addresses/1 or /sales/addresses/1.json
  def show
  end

  # GET /sales/addresses/new
  def new
    @address = Sales::Address.new
  end

  # GET /sales/addresses/1/edit
  def edit
  end

  # POST /sales/addresses or /sales/addresses.json
  def create
    @address = Sales::Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to sales_seller_addresses_path(@seller), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/addresses/1 or /sales/addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to sales_seller_addresses_path(@seller), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/addresses/1 or /sales/addresses/1.json
  def destroy
    @address.destroy!

    respond_to do |format|
      format.html { redirect_to sales_seller_addresses_path(@seller), notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Sales::Address.find(params[:id])
    end

    def set_seller
      @seller = Sales::Seller.find(params[:seller_id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params[:sales_address][:sales_sellers_id] = params[:seller_id]
      params.require(:sales_address).permit(:rua, :numero, :bairro, :cep, :bairro, :estado, :sales_sellers_id)
    end
end
