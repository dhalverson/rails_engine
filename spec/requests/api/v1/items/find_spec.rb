require 'rails_helper'

RSpec.describe 'Items Endpoints' do
  it 'can find a single record that matches a set of criteria' do
    dog = create(:item, name: 'Dog Toy')
    cat = create(:item, name: 'Cat Toy')

    get '/api/v1/items/find?name=dog'

    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to be_a(Hash)

    expect(item[:data][:attributes][:name]).to eq(dog.name)
  end
end