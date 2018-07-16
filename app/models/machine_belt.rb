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


  # Scopes
  scope :belts_with_attributes, lambda{ |machine, belt_machine_attributes|
    includes(:machine, :belt)
      .where(
        machine: machine,
        belt: Belt.with_belt_machine_attributes(belt_machine_attributes)
      )
  }
end
