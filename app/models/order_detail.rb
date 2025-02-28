class OrderDetail < ApplicationRecord
  enum making_status: { Unavailable: 0, Pending: 1, Production: 2, Completed: 3 }

  belongs_to :order
  belongs_to :item
end