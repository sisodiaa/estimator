class BeltMachineRunner
  include QueryRunnable

  def runner_attributes
    @query_type = "belt_machine"
    @attributes_service = BeltMachineAttributes
    @results_service = BeltMachineResults
  end
end
