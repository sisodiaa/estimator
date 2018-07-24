class MachineBelt < ApplicationRecord
  # Associations
  belongs_to :machine
  belongs_to :belt


  # Callbacks
  before_save :set_price
  after_save :update_machine_potential
  after_destroy :update_machine_potential


  # Validations
  validates :belt, presence: true

  validates :length, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :width, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :priority, presence: true,
    numericality: { only_integer: true, greater_than: 0 }


  # Scopes
  scope :belts_with_attributes, lambda{ |machine, belt_machine_attributes|
    includes(:machine, :belt)
      .where(
        machine: machine,
        belt: Belt.with_belt_machine_attributes(belt_machine_attributes)
      )
  }


  # Methods
  def update_price
    # Save trigger callbacks, which in turn call set_price method
    save
  end


  # Callback Methods and their associated methods
  def set_price
    self.price = calculate_price
  end

  def update_machine_potential
    machine.update_potential if update_machine_potential?
  end

  def calculate_price
    belt.rate * (adjusted_length / 1000.0) * (adjusted_width / 10.0) * quantity
  end

  def adjusted_length
    length > 10000 ? length + belt.major_join_charge : length + belt.minor_join_charge
  end

  def adjusted_width
    width % 10 == 0 ? width : (width / 10) * 10 + belt.rounding_off * 5
  end

  def update_machine_potential?
    destroyed_by_association.nil? || not_destroyed_by_machine?
  end

  def not_destroyed_by_machine?
    destroyed_by_association.foreign_key != "machine_id"
  end
end
