class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :customer_id, foreign_key: true
      t.string :merchant_id, foreign_key: true
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
