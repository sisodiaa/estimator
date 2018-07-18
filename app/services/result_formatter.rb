class ResultFormatter
  def call(query_type, results)
    formatter = format_type[query_type]
    formatter.new.call(results)
  end

  private

  def format_type
    {
      "machine_mill" => MachineMillFormatter,
      "belt_machine" => BeltMachineFormatter
    }
  end
end
