class Mill < ApplicationRecord
  include WhitespaceStripper

  has_many :mill_machines, dependent: :destroy
  has_many :machines, through: :mill_machines

  validates :name, presence: true
  validates :location, presence: true
  validates :code, presence: true, uniqueness: true

  def to_param
    code
  end
end
