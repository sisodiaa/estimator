class Machine < ApplicationRecord
  include WhitespaceStripper
  
  has_many :mill_machines, dependent: :destroy
  has_many :mills, through: :mill_machines

  validates :make, presence: true
  validates :model, presence: true
  validates :section, presence: true

  def machine_name
    "#{make} #{model}"
  end
end
