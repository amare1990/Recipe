class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: {only_decimal: true, greater_than_or_equal_to: 0}
  validates :quantity, presence: true, numericality: {only_float: true, greater_than_or_equal_to: 0}

end