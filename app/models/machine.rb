class Machine < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :section, presence: true
end
