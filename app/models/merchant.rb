class Merchant < ApplicationRecord
  validates_presence_of :name
                        # :created_at,
                        # :updated_at
  has_many :invoices
  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  # def self.highest_revenue(limit)
  #   "SELECT m.*, SUM(ii.unit_price * ii.quantity) AS Revenue
  #   FROM merchants m
  #   JOIN items i ON m.id = i.merchant_id
  #   JOIN invoice_items ii ON i.id = ii.item_id
  #   JOIN invoices inv ON ii.invoice_id = inv.id
  #   JOIN transactions t ON inv.id = t.invoice_id
  #   WHERE inv.status = 'shipped' AND t.result = 'success'
  #   GROUP BY m.id
  #   ORDER BY Revenue DESC
  #   LIMIT #{limit}"
  # end

  def self.highest_revenue(limit)
    Merchant.select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue').joins(:invoice_items, :transactions).where(transactions: {result: 'success'}, invoices: {status: 'shipped'}).group(:id).order('revenue desc').limit(limit)
  end
end
