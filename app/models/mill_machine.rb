class MillMachine < ApplicationRecord
  # Associations
  belongs_to :mill

  belongs_to :machine

  has_many :mill_machine_belts, dependent: :destroy
  has_many :belts, through: :mill_machine_belts


  # Callbacks
  before_save :set_potential
  after_save :update_mill_potential


  # Validations
  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :machine, presence: true


  # Scopes
  scope :count_of_machines_by_maker_in_a_mill, lambda { |mill, maker|
    where(
      mill: Mill.find_by(code: mill.code),
      machine: Machine.where(make: maker)
    ).sum(:quantity)
  }

  scope :machines_with_attributes, lambda{ |mill, machine_attributes|
    includes(:mill, :machine)
      .where(
        mill: mill,
        machine: Machine.where(machine_attributes)
      )
  }
  
  scope :mills_with_machine_model, lambda { |model_id|
    where(machine: Machine.where(id: model_id))
  }


  # Methods
  def update_potential
    # Save trigger callbacks, which in turn call set_price method
    save
  end

  def set_potential
    self.potential = calculate_potential
  end

  def calculate_potential
    machine.potential * quantity
  end

  def update_mill_potential
    mill.update_potential
  end
end
