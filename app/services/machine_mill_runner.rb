class MachineMillRunner
  include QueryRunnable

  def runner_attributes
    @query_type = "machine_mill"
    @attributes_service = MachineMillAttributes
    @results_service = MachineMillResults
  end
end
