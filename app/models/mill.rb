class Mill < ApplicationRecord
  include WhitespaceStripper

  # Associations
  has_many :mill_machines, dependent: :destroy
  has_many :machines, through: :mill_machines


  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :code, presence: true, uniqueness: true


  # Scopes
  scope :with_machines_by_maker, lambda { |maker|
    includes(:machines).where(machines: {make: maker})
  }


  # methods
  def to_param
    code
  end
end
