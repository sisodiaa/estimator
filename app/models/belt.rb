class Belt < ApplicationRecord
  include WhitespaceStripper

  # Associations
  has_many :mill_machine_belts, dependent: :destroy
  has_many :mill_machines, through: :mill_machine_belts


  # Callbacks
  before_save { grade.upcase! }

  
  # Validations
  validates :grade, presence: true
end
