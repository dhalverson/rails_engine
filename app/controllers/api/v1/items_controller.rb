class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def update
    render json: ItemSerializer.new(Item.update(params[:id], item_params))
  end

  def create
    render json: ItemSerializer.new(Item.new(item_params))
  end

  def destroy
    Item.destroy(params[:id])
    render body: nil, status: :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price)
  end
end
