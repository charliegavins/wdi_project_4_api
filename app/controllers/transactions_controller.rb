class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = @current_user.transactions.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  def webhooktest
    render json: { status: 200 }
  end

  def webhook
    wallet_address = params[:data][:address]
    p wallet_address
    @transaction = Transaction.where(wallet_address: wallet_address).last
    if @transaction
      @transaction.update!(payment_status: "complete")
      render json: { status: 200 }
    else
      render json: { status: 404 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:message, :amount, :payment_status, :recipient_url, :recipient_name, :recipient_img, :user_id, :qr_image_url)
    end
end
