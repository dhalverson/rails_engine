class Transaction < ApplicationRecord
  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :credit_card_expiration,
                        :result,
                        :created_at,
                        :updated_at
  belongs_to :invoice
end
