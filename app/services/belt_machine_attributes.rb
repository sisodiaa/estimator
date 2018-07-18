class BeltMachineAttributes
  def call(query_parameters)
    {
      belts: {
        grade: query_parameters[:grade]
      }.select { |key, value| value != "all" },

      machine_belts: {
        length: belt_length(query_parameters),
        width: belt_width(query_parameters)
      }.select { |key, value| value != (0..0) }

    }.select { |key, value| value != {} }
  end

  def belt_length(query_parameters)
    query_parameters[:length_min].to_i..query_parameters[:length_max].to_i
  end

  def belt_width(query_parameters)
    query_parameters[:width_min].to_i..query_parameters[:width_max].to_i
  end
end
