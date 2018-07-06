class MachineBelt < ApplicationRecord
  # Associations
  belongs_to :machine
  belongs_to :belt



  # Validations
  validates :belt, presence: true

  validates :length, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :width, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
end
