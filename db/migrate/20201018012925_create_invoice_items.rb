class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.string :item_id, foreign_key: true
      t.string :invoice_id, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
