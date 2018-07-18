module ResultFormattable
  attr_reader :template_type, :primary, :secondary

  def initialize
    format_attributes
  end

  def format_attributes
    raise 'You must initialize @template_type, @primary, and @secondary'
  end

  def call(results)
    Struct.new(:template, :results).new(template_type, list(results))
  end

  def list(results)
    results.map do |primary_value, secondary_value|
      Struct
        .new(primary, :sum, secondary)
        .new(primary_value, secondary_value.sum(:quantity), secondary_value)
    end
  end
end
