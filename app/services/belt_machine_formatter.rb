class BeltMachineFormatter
  include ResultFormattable

  def format_attributes
    @template_type   = "type_belt_machine"
    @primary   = :machine
    @secondary = :machine_belts
  end
end
