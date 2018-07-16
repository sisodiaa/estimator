class QueryResult
  attr_reader :query_type, :metadata, :results

  def initialize(query_type, metadata, results)
    @query_type = query_type
    @metadata = metadata
    @results = results
  end

  def call
    query_result
  end

  private

  def query_result
    list_with_count
  end

  def list_with_count
    Struct.new(:template, :metadata, :result)
      .new(template, metadata, results_list)
  end

  def results_list
    case query_type
    when "machine_mill"
      mills_list
    when "belt_machine"
      machines_list
    end
  end

  def template
    "type_#{query_type}"
  end

  def mills_list
    results.map do |mill, mill_machines|
      Struct
        .new(:mill, :sum, :mill_machines)
        .new(mill, mill_machines.sum(:quantity), mill_machines)
    end
  end

  def machines_list
    results.map do |machine, machine_belts|
      Struct
        .new(:machine, :sum, :machine_belts)
        .new(machine, machine_belts.sum(:quantity), machine_belts)
    end
  end
end
