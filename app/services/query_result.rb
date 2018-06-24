class QueryResult
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def call
    query_result
  end

  private

  def query_result
    case query_type
    when "maker", "model"
      mills_list_with_machine_count
    end
  end

  def query_type
    response.first
  end

  def mills_list_with_machine_count
    mills_list = response.last.map do |row|
      Struct.new(:mill, :quantity).new(row.first, row.last)
    end

    Struct.new(:template, :metadata, :result)
      .new(template, response[1], mills_list)
  end

  def template
    "type_#{query_type}"
  end
end
