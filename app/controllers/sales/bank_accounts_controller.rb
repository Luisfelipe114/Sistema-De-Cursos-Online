class Sales::BankAccountsController < Sales::ApplicationController
  before_action :set_bank_account, only: %i[ show edit update destroy ]

  # GET /sales/bank_accounts or /sales/bank_accounts.json
  def index
    @bank_accounts = @seller.sales_bank_accounts
  end

  # GET /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def show
  end

  # GET /sales/bank_accounts/new
  def new
    @bank_account = Sales::BankAccount.new
  end

  # GET /sales/bank_accounts/1/edit
  def edit
  end

  # POST /sales/bank_accounts or /sales/bank_accounts.json
  def create
    @bank_account = Sales::BankAccount.new(bank_account_params)

    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to sales_seller_bank_accounts_path(@seller), notice: "Bank account was successfully created." }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to sales_seller_bank_accounts_path(@seller), notice: "Bank account was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def destroy
    @bank_account.destroy!

    respond_to do |format|
      format.html { redirect_to sales_seller_bank_accounts_path(@seller), notice: "Bank account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = Sales::BankAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params[:sales_bank_account][:sales_sellers_id] = params[:seller_id]
      params.require(:sales_bank_account).permit(:numero, :agencia, :banco, :sales_sellers_id)
    end
end
