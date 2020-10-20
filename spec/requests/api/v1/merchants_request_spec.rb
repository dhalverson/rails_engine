require 'rails_helper'

RSpec.describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:name)
      expect(merchant[:name]).to be_a(String)

      expect(merchant).to have_key(:created_at)
      expect(merchant[:created_at]).to be_a(String)

      expect(merchant).to have_key(:updated_at)
      expect(merchant[:updated_at]).to be_a(String)
    end
  end
  
  it 'can get a single merchant by id' do
    id = create(:merchant).id
    
    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to eq(id)

    expect(merchant).to have_key(:name)
    expect(merchant[:name]).to be_a(String)

    expect(merchant).to have_key(:created_at)
    expect(merchant[:created_at]).to be_a(String)

    expect(merchant).to have_key(:updated_at)
    expect(merchant[:updated_at]).to be_a(String)
  end

  it 'can update a merchant by id' do
    id = create(:merchant).id
    merchant_params = {name: 'Hudson Holdings'}
    patch "/api/v1/merchants/#{id}", params: merchant_params

    merchant = JSON.parse(response.boy, symbolize_names: true)

    expect(response).to be_successful
    
    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to eq(id)

    expect(merchant).to have_key(:name)
    expect(merchant[:name]).to be_a(String)

    expect(merchant).to have_key(:created_at)
    expect(merchant[:created_at]).to be_a(String)

    expect(merchant).to have_key(:updated_at)
    expect(merchant[:updated_at]).to be_a(String)
  end
end
