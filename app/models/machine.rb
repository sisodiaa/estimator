class Machine < ApplicationRecord
  include WhitespaceStripper

  attr_accessor :via_form


  # Associations
  has_many :mill_machines, dependent: :destroy
  has_many :mills, through: :mill_machines

  has_many :machine_belts, dependent: :destroy
  has_many :belts, through: :machine_belts


  # Callbacks
  before_save :set_attributes_case, if: :via_form?
  after_save :update_mill_machine_potential, unless: :via_form?


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
      mb.where(length: length, width: width, quantity: quantity).maximum(:price)
    end.sum
  end

  def via_form?
    !!via_form
  end


  # Activerecord methods
  def self.having_belts_with_attributes(belt_machine_attributes)
    return includes(:belts, :machine_belts) if belt_machine_attributes.empty?
    includes(:belts, :machine_belts).where(belt_machine_attributes)
  end


  # Callback Methods
  def update_mill_machine_potential
    mill_machines.each(&:update_potential)
  end
end
