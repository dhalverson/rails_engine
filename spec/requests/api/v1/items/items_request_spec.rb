require 'rails_helper'

RSpec.describe 'Items API' do
  it 'sends a list of items' do
    create_list(:item, 3)
    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(3)
    expect(items[:data]).to be_an(Array)

    items[:data].each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_a(String)

      expect(item).to have_key(:type)
      expect(item[:type]).to be_a(String)

      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to be_a(Hash)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)
      
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a(Float)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_an(String)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_an(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_an(Float)

      expect(item).to have_key(:relationships)
      expect(item[:attributes]).to be_a(Hash)
    end
  end

  it 'can get a single item by id' do
    id = create(:item).id
    get "/api/v1/items/#{id}"
   
    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)
    
    expect(item[:data]).to have_key(:id)
    expect(item[:data][:id]).to be_a(String)

    expect(item[:data]).to have_key(:type)
    expect(item[:data][:type]).to be_a(String)

    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to be_a(Hash)

    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_a(String)
    
    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes][:description]).to be_a(String)

    expect(item[:data][:attributes]).to have_key(:unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)

    expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to be_an(Integer)

    expect(item[:data]).to have_key(:relationships)
    expect(item[:data][:attributes]).to be_a(Hash)
  end

  it 'can update an item by id' do
    id = create(:item).id
    item_params = { name: 'Updated Item Name', description: 'Updated description', unit_price: 10.99 }
    patch "/api/v1/items/#{id}", params: item_params
    
    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to have_key(:id)
    expect(item[:data][:id]).to be_a(String)

    expect(item[:data]).to have_key(:type)
    expect(item[:data][:type]).to be_a(String)

    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to be_a(Hash)

    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_a(String)
    
    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes][:description]).to be_a(String)

    expect(item[:data][:attributes]).to have_key(:unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)

    expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to be_an(Integer)

    expect(item[:data]).to have_key(:relationships)
    expect(item[:data][:attributes]).to be_a(Hash)

    expect(item[:data][:attributes][:name]).to eq(item_params[:name])
  end

  it 'can create an item' do
    item_params = { name: 'New Item Name', description: 'New description', unit_price: 19.99 }
    post '/api/v1/items', params: item_params

    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to have_key(:id)

    expect(item[:data]).to have_key(:type)
    expect(item[:data][:type]).to be_a(String)

    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to be_a(Hash)

    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_a(String)
    
    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes][:description]).to be_a(String)

    expect(item[:data][:attributes]).to have_key(:unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)

    expect(item[:data][:attributes]).to have_key(:merchant_id)

    expect(item[:data]).to have_key(:relationships)
    expect(item[:data][:attributes]).to be_a(Hash)

    expect(item[:data][:attributes][:name]).to eq(item_params[:name])
  end

  it 'can delete an existing item' do
    id = create(:item).id
    
    expect{ delete "/api/v1/items/#{id}" }.to change(Item, :count).by(-1)
    expect(response.status).to eq(204)
    expect{Item.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'can return the merchant associated with an item' do
    id = create(:item).id
    get "/api/v1/items/#{id}/merchants"

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data]).to have_key(:id)

    expect(merchant[:data]).to have_key(:type)
    expect(merchant[:data][:type]).to be_a(String)

    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to be_a(Hash)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)
  
    expect(merchant[:data]).to have_key(:relationships)
    expect(merchant[:data][:attributes]).to be_a(Hash)

    expect(merchant[:data][:relationships]).to have_key(:items)
    expect(merchant[:data][:relationships][:items]).to be_a(Hash)
  end
end