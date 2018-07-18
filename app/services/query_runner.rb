class QueryRunner
  def call(query_parameters)
    # Delete method for query_parameters hash return value for deleted key
    # and query_parameters hash is passed on without "type" key
    runner = runner_type[query_parameters.delete("type")]

    runner.new.call query_parameters
  end

  private

  def runner_type
    {
      "machine_mill" => MachineMillRunner,
      "belt_machine" => BeltMachineRunner
    }
  end
end
