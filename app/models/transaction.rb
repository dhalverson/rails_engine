class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number,
                        # :credit_card_expiration_date,
                        :result
                        # :created_at,
                        # :updated_at
  belongs_to :invoice
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
