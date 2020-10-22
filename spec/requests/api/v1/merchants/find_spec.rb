require 'rails_helper'

RSpec.describe 'Merchants Endpoints' do
  it 'can find a single record that matches a set of criteria' do
    merchant1 = create(:merchant, name: 'Dog Merchant')
    merchant2 = create(:merchant, name: 'Cat Merchant')

    get '/api/v1/merchants/find?name=dog'

    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to be_a(Hash)

    expect(item[:data][:attributes][:name]).to eq(merchant1.name)
    expect(item[:data][:attributes][:name]).to_not eq(merchant2.name)
  end

  it 'can find all records that match a set of criteria' do
    merchant1 = create(:merchant, name: 'Dog Merchant')
    merchant2 = create(:merchant, name: 'Cat Merchant')
    merchant3 = create(:merchant, name: 'Paws & Doggies Merchant')

    get '/api/v1/merchants/find_all?name=dog'

    expect(response).to be_successful
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data]).to be_an(Array)
    expect(merchants[:data].count).to eq(2)
    expect(merchants[:data][0][:attributes][:name]).to eq(merchant1.name)
  end
end
