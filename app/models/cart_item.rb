class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  validates :amount, presence: true

  def subtotal
    item.tax_included_price * amount
  end
end
