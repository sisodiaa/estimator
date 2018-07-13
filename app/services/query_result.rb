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
    case query_type
    when "machine_mill"
      mills_list_with_machine_count
    end
  end

  def mills_list_with_machine_count
    Struct.new(:template, :metadata, :result)
      .new(template, metadata, mills_list)
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
end
