class Machine < ApplicationRecord
  include WhitespaceStripper


  # Associations
  has_many :mill_machines, dependent: :destroy
  has_many :mills, through: :mill_machines


  # Callbacks
  before_save :set_attributes_case
  

  # Validations
  validates :make, presence: true
  validates :model, presence: true
  validates :section, presence: true


  # methods
  def machine_name
    "#{make.titleize} #{model}"
  end

  def set_attributes_case
    make.downcase!
    model.upcase!
    section.downcase!
    sub_section.downcase!
  end
end
