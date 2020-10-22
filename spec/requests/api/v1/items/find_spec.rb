require 'rails_helper'

RSpec.describe 'Items Endpoints' do
  it 'can find a single record that matches a set of criteria' do
    item1 = create(:item, name: 'Dog Toy')
    item2 = create(:item, name: 'Cat Toy')

    get '/api/v1/items/find?name=dog'

    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to be_a(Hash)

    expect(item[:data][:attributes][:name]).to eq(item1.name)
    expect(item[:data][:attributes][:name]).to_not eq(item2.name)
  end

  it 'can find all records that match a set of criteria' do
    item1 = create(:item, name: 'Dog Toy')
    item2 = create(:item, name: 'Cat Toy')
    item3 = create(:item, name: 'Dog Bone')

    get '/api/v1/items/find_all?name=dog'

    expect(response).to be_successful
    items = JSON.parse(response.body, symbolize_names: true)

     expect(items[:data]).to be_an(Array)
     expect(items[:data].count).to eq(2)
     expect(items[:data][0][:attributes][:name]).to eq(item1.name)
  end
end