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
    when "grade"
      list_of_mills
    when "recommend"
      list_of_belt_grades
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
      .new(template, metadata, mills_list)
  end

  def list_of_mills
    mills_list = response.last.map do |row|
      Struct.new(:mill).new(row)
    end

    Struct.new(:template, :metadata, :result)
      .new(template, metadata, mills_list)
  end

  def list_of_belt_grades
    belt_grades_list = response.last.map do |row|
      Struct.new(:belt).new(row)
    end

    Struct.new(:template, :metadata, :result)
      .new(template, metadata, belt_grades_list)
  end

  def template
    "type_#{query_type}"
  end
  
  def metadata
    response[1]
  end
end
