class MillMachineBelt < ApplicationRecord
  # Associations
  belongs_to :mill_machine
  belongs_to :belt

  
  # Validations
  validates :belt, presence: true
end
