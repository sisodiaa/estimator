module MillMachinesHelper
  def machines_list
    hash = {}
    Machine.order(:make).order(:model).to_a.each do |machine|
      if hash.has_key?(machine.make.upcase)
        hash[machine.make.upcase].push([machine.model, machine.id])
      else
        hash[machine.make.upcase] = [[machine.model, machine.id]]
      end
    end
    hash.to_a
  end
end
