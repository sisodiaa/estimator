class MillMachineBelt < ApplicationRecord
  # Associations
  belongs_to :mill_machine
  belongs_to :belt

  
  # Validations
  validates :belt, presence: true


  # Scopes
  scope :count_of_belts_in_mill, lambda { |id, mill|
    includes(:belt, :mill_machine)
      .where(belts: {id: id}, mill_machines: {mill: mill})
      .count
  }
end
