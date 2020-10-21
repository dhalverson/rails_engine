class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(params[:id])
    merchant = item.merchant
    render json: MerchantSerializer.new(merchant)
  end
end