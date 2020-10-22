require 'rails_helper'

RSpec.describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)
    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(3)

    merchants[:data].each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to be_a(String)

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to be_a(Hash)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)

      expect(merchant).to have_key(:relationships)
      expect(merchant[:attributes]).to be_a(Hash)
    end
  end
  
  it 'can get a single merchant by id' do
    id = create(:merchant).id
    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)
    
    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data][:id]).to be_a(String)

    expect(merchant[:data]).to have_key(:type)
    expect(merchant[:data][:type]).to be_a(String)

    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to be_a(Hash)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)

    expect(merchant[:data]).to have_key(:relationships)
    expect(merchant[:data][:attributes]).to be_a(Hash)
  end

  it 'can update a merchant by id' do
    id = create(:merchant).id
    merchant_params = { name: 'Hudson Holdings' }
    patch "/api/v1/merchants/#{id}", params: merchant_params

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data][:id]).to be_a(String)

    expect(merchant[:data]).to have_key(:type)
    expect(merchant[:data][:type]).to be_a(String)

    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to be_a(Hash)

    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)

    expect(merchant[:data]).to have_key(:relationships)
    expect(merchant[:data][:attributes]).to be_a(Hash)

    expect(merchant[:data][:attributes][:name]).to eq(merchant_params[:name])
  end

  it 'can create a merchant' do
    merchant_params = { name: 'Hudson Holdings' }
    post '/api/v1/merchants', params: merchant_params
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

    expect(merchant[:data][:attributes][:name]).to eq(merchant_params[:name])
  end

  it 'can delete an existing merchant' do
    merchant = create(:merchant)
    create(:item, merchant: merchant)
    id = merchant.id
   
    expect{ delete "/api/v1/merchants/#{id}" }.to change(Merchant, :count).by(-1)
    expect(response.status).to eq(204)
    expect(merchant.items.count).to eq(0)
    expect{Merchant.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'can return the items associated with a merchant' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)
    id = merchant.id

    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful
    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data][0]).to have_key(:id)

    expect(items[:data][0]).to have_key(:type)
    expect(items[:data][0][:type]).to be_a(String)

    expect(items[:data][0]).to have_key(:attributes)
    expect(items[:data][0][:attributes]).to be_a(Hash)

    expect(items[:data][0][:attributes]).to have_key(:name)
    expect(items[:data][0][:attributes][:name]).to be_a(String)
  
    expect(items[:data][0]).to have_key(:relationships)
    expect(items[:data][0][:attributes]).to be_a(Hash)

    expect(items[:data][0][:relationships]).to have_key(:invoice_items)
    expect(items[:data][0][:relationships][:invoice_items]).to be_a(Hash)
  end
end
