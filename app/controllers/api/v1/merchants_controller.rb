class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end
  
  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params))
  end

  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at)
  end
end