class OrderDetail < ApplicationRecord
  enum making_status: { unavailable: 0, pending: 1, production: 2, completed: 3 }

  belongs_to :order
  belongs_to :item
end
