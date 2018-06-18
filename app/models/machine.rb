class Machine < ApplicationRecord
  include WhitespaceStripper

  validates :make, presence: true
  validates :model, presence: true
  validates :section, presence: true
end
