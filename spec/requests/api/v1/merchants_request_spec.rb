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

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
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

    merchant = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful

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
    id = create(:merchant).id

    expect{ delete "/api/v1/merchants/#{id}" }.to change(Merchant, :count).by(-1)
    
    expect(response.status).to eq(204)
    expect{Merchant.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
