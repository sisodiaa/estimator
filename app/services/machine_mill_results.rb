class MachineMillResults
  def call(attributes)
    mills = Mill.having_machine_with_attributes attributes

    mills.map do |mill|
      [
        mill,
        MillMachine.machines_with_attributes(mill, attributes)
      ]
    end
  end
end
