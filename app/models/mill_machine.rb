class MillMachine < ApplicationRecord
  # Associations
  belongs_to :mill
  belongs_to :machine


  # Validations
  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :machine, presence: true


  # Scopes
  scope :count_of_machines_by_maker_in_a_mill, lambda { |mill, maker|
    where(
      mill: Mill.find_by(code: mill.code),
      machine: Machine.where(make: maker)
    ).sum(:quantity)
  }
  
  scope :mills_with_machine_model, lambda { |model_id|
    where(machine: Machine.where(id: model_id))
  }
end
