class MachineMillAttributes
  def call(query_parameters)
    {
      section: query_parameters[:section],
      make: query_parameters[:maker],
      model: query_parameters[:model]
    }.select { |key, value| value != "all" }
  end
end
