class QueryRunner
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    query_runner
  end

  private

  def query_runner
    case query_type
    when "machine_mill"
      get_mills_list_with_machine_count_by_machine_attributes
    end
  end

  def get_mills_list_with_machine_count_by_machine_attributes
    [query_type, metadata, mills_list_with_machine_count_by_machine_attributes]
  end

  def query_type
    @query_type ||= params[:type]
  end

  def machine_section
    @machine_section ||= params[:section]
  end

  def machine_maker
    @machine_maker ||= params[:maker]
  end

  def machine_model
    @machine_model ||= params[:model]
  end

  def machine_model_id
    @machine_model_id ||= params[:model]
  end

  def machine_attributes
    @machine_attributes ||= {
      section: machine_section,
      make: machine_maker,
      model: machine_model
    }.select { |key, value| value != "all" }
  end

  def metadata
    {
      section: machine_section.titleize,
      maker: machine_maker.titleize,
      model: machine_model.titleize
    }
  end

  def mills
    Mill.having_machine_with_attributes machine_attributes
  end

  def mills_list_with_machine_count_by_machine_attributes
    mills.map do |mill|
      [
        mill,
        MillMachine.machines_with_attributes(mill, machine_attributes)
      ]
    end
  end
end
