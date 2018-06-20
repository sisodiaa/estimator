module MillMachinesHelper
  def machines_list
    hash = {}
    Machine.order(:make).order(:model).to_a.each do |machine|
      if hash.has_key?(machine.make)
        hash[machine.make].push([machine.model, machine.id])
      else
        hash[machine.make] = [[machine.model, machine.id]]
      end
    end
    hash.to_a
  end

  def mill_machine_form_path(record)
    record.new_record? ? mill_machines_path : mill_machine_path
  end
end
