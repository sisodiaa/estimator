class Mill < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :code, presence: true, uniqueness: true
end
