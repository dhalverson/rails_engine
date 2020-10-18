class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :unit_price
      t.string :merchant_id, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
