class Belt < ApplicationRecord
  include WhitespaceStripper


  # Associations
  has_many :mill_machine_belts, dependent: :destroy
  has_many :mill_machines, through: :mill_machine_belts

  has_many :machine_belts, dependent: :destroy
  has_many :machines, through: :machine_belts


  # Callbacks
  before_save { grade.upcase! }

  
  # Validations
  validates :grade, presence: true, uniqueness: true


  # Scopes
  scope :for_machines, lambda { |machines|
    includes(:mill_machines).where(mill_machines: { machine_id: machines })
  }

  scope :procured_for_machines_in_mill, lambda { |mill, machines|
    includes(:mill_machines)
      .where(mill_machines: { mill_id: mill, machine_id: machines })
  }
end
