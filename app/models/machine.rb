class Machine < ApplicationRecord
  include WhitespaceStripper


  # Associations
  has_many :mill_machines, dependent: :destroy
  has_many :mills, through: :mill_machines

  has_many :machine_belts, dependent: :destroy
  has_many :belts, through: :machine_belts


  # Callbacks
  before_save :set_attributes_case


  # Validations
  validates :make, presence: true
  validates :model, presence: true
  validates :section, presence: true


  # Methods
  def machine_name
    "#{make.titleize} #{model}"
  end

  def set_attributes_case
    make.downcase!
    model.upcase!
    section.downcase!
    sub_section.downcase!
  end

  def update_potential
    self.potential = calculate_potential
    save
  end

  def calculate_potential
    mb ||= machine_belts
    mb.group(:length, :width, :quantity).count(:id).keys.map do |length, width, quantity|
      mb.where(length: length, width: width, quantity: quantity).order("price DESC").first.price
    end.sum
  end


  # Activerecord methods
  def self.having_belts_with_attributes(belt_machine_attributes)
    return includes(:belts, :machine_belts) if belt_machine_attributes.empty?
    includes(:belts, :machine_belts).where(belt_machine_attributes)
  end
end
