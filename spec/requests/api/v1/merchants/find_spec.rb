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
end
