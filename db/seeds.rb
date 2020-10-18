require 'csv'    

Customer.destroy_all
CSV.foreach('customers.csv', headers: :true, header_converters: :symbol) do |row|
  Customer.create!({
    id: row[:id],
    first_name: row[:first_name],
    last_name: row[:last_name],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end

Item.destroy_all
CSV.foreach('items.csv', headers: :true, header_converters: :symbol) do |row|
  Iteam.create!({
    id: row[:id],
    name: row[:name],
    description: row[:description],
    unit_price: row[:unit_price],
    merchant_id: row[:marchant_id],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end

Merchant.destroy_all
CSV.foreach('merchants.csv', headers: :true, header_converters: :symbol) do |row|
  Customer.create!({
    id: row[:id],
    name: row[:name],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end

Invoice.destroy_all
CSV.foreach('invoices.csv', headers: :true, header_converters: :symbol) do |row|
  Invoice.create!({
    id: row[:id],
    customer_id: row[:customer_id],
    merchant_id: row[:merchant_id],
    status: row[:status],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end

InvoiceItem.destroy_all
CSV.foreach('invoice_items.csv', headers: :true, header_converters: :symbol) do |row|
  InvoiceItem.create!({
    id: row[:id],
    item_id: row[:item_id],
    invoice_id: row[:invoice_id],
    quantity: row[:quantity],
    unit_price: row[:unit_price],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end

Transaction.destroy_all
CSV.foreach('transactions.csv', headers: :true, header_converters: :symbol) do |row|
  Transaction.create!({
    id: row[:id],
    invoice_id: row[:invoice_id],
    credit_card_number: row[:credit_card_number],
    credit_card_expiration: row[:credit_card_expiration],
    result: row[:result],
    created_at: row[:created_at],
    updated_at: row[:updated_at]
  })
end