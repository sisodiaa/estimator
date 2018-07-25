class Mill < ApplicationRecord
  include WhitespaceStripper

  attr_accessor :via_form


  # Associations
  has_many :mill_machines, dependent: :destroy
  has_many :machines, through: :mill_machines


  # Callbacks
  before_save :set_attributes_case, if: :via_form?


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

  def set_attributes_case
    name.downcase!
    location.downcase!
    code.downcase!
  end

  def total_spindles
    mill_machines.map(&:spindles_count).sum
  end

  def update_potential
    self.potential = calculate_potential
    save
  end

  def calculate_potential
    mill_machines.sum(:potential)
  end

  def via_form?
    !!via_form
  end


  # Activerecord methods
  def self.having_machine_with_attributes(machine_attributes)
    return includes(:machines) if machine_attributes.empty?
    includes(:machines).where(machines: machine_attributes)
  end
end
