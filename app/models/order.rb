class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { pending: 0, confirmation: 1, production: 2, preparation: 3, shipment: 4 }

  belongs_to :customer
  has_many :order_details, dependent: :destroy
end
