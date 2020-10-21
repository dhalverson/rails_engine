class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
