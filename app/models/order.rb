class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { pending: 0, confirmation: 1, production: 2, preparation: 3, shipment: 4 }
  after_initialize :set_defaults

  def set_defaults
    self.shipping_cost ||= 800
  end

  belongs_to :customer
  has_many :order_details, dependent: :destroy
end
