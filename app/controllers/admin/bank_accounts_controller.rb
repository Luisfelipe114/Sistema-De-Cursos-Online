class Admin::BankAccountsController < ApplicationController
  layout "admin"

  before_action :set_bank_account, only: %i[ show edit update destroy ]
  before_action :set_admin

  # GET /admin/bank_accounts or /admin/bank_accounts.json
  def index
    @bank_accounts = @administrator.admin_bank_accounts
  end

  # GET /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def show
  end

  # GET /admin/bank_accounts/new
  def new
    @bank_account = Admin::BankAccount.new
  end

  # GET /admin/bank_accounts/1/edit
  def edit
  end

  # POST /admin/bank_accounts or /admin/bank_accounts.json
  def create
    @bank_account = Admin::BankAccount.new(bank_account_params)

    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to admin_administrator_bank_accounts_path(@administrator), notice: "Bank account was successfully created." }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to admin_administrator_bank_accounts_path(@administrator), notice: "Bank account was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def destroy
    @bank_account.destroy!

    respond_to do |format|
      format.html { redirect_to admin_administrator_bank_accounts_path(@administrator), notice: "Bank account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = Admin::BankAccount.find(params[:id])
    end

    def set_admin
      @administrator = Admin::Administrator.find(params[:administrator_id])
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params[:admin_bank_account][:admin_administrators_id] = params[:administrator_id]
      params.require(:admin_bank_account).permit(:numero, :agencia, :banco, :admin_administrators_id)
    end
end
