class BeltMachineResults
  def call(attributes)
    machines = Machine.having_belts_with_attributes attributes

    machines.map do |machine|
      [
        machine,
        MachineBelt.belts_with_attributes(machine, attributes)
      ]
    end.select { |arr| arr.last.present? }
  end
end
