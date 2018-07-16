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


  # Activerecord methods
  def self.with_belt_machine_attributes(belt_machine_attributes)
    return all if belt_machine_attributes.empty?
    where(belt_machine_attributes)
  end
end
