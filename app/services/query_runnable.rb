module QueryRunnable
  attr_reader :query_type, :attributes_service, :attributes, :results_service

  def initialize
    runner_attributes
  end

  def runner_attributes
    raise 'Initialize attributes for runner'
  end

  def call(query_parameters)
    set_attributes query_parameters
    results
  end

  def set_attributes(query_parameters)
    @attributes ||= attributes_service.new.call query_parameters
  end

  def results
    [ query_type, results_service.new.call(attributes) ]
  end
end
