class MillMachine < ApplicationRecord
  belongs_to :mill
  belongs_to :machine

  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :machine, presence: true
end
