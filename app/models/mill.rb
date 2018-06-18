class Mill < ApplicationRecord
  include WhitespaceStripper

  validates :name, presence: true
  validates :location, presence: true
  validates :code, presence: true, uniqueness: true

  def to_param
    code
  end
end
