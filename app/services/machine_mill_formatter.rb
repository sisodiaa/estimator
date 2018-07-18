class MachineMillFormatter
  include ResultFormattable

  def format_attributes
    @template_type = "type_machine_mill"
    @primary   = :mill
    @secondary = :mill_machines
  end
end
