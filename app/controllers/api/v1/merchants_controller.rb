class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end
  
  def show
    render json: Merchant.find(params[:id])
  end

  def update
    require 'pry'; binding.pry
    merchant = Merchant.find(params[:id])
    render json:  merchant.update(merchant_params)
  end

  private

  def merchant_params
    params.permit(:name, :created_at, :updated_at)
  end
end