class Belt < ApplicationRecord
  include WhitespaceStripper

  before_save { grade.upcase! }

  validates :grade, presence: true
end
