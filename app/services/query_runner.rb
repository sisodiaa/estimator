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
    when "belt_machine"
      get_machines_list_with_belt_count_by_belt_attributes
    end
  end

  def get_mills_list_with_machine_count_by_machine_attributes
    [query_type, metadata, mills_list_with_machine_count_by_machine_attributes]
  end

  def get_machines_list_with_belt_count_by_belt_attributes
    [query_type, metadata, machines_list_with_belt_count_by_belt_attributes]
  end

  def query_type
    @query_type ||= params[:type]
  end

  def machine_attributes
    @machine_attributes ||= {
      section: machine_section,
      make: machine_maker,
      model: machine_model
    }.select { |key, value| value != "all" }
  end

  def belt_machine_attributes
    @belt_machine_attributes ||= {
      belts: { grade: belt_grade }.select { |key, value| value != "all" },
      machine_belts: { length: belt_length, width: belt_width }.select { |key, value| value != (0..0) }
    }.select { |key, value| value != {} }
  end

  def metadata
    case query_type
    when "machine_mill"
      {
        section: machine_section.titleize,
        maker: machine_maker.titleize,
        model: machine_model.titleize
      }
    when "belt_machine"
      {
        grade: belt_grade,
        length: belt_length,
        width: belt_width
      }
    end
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

  def belt_grade
    @belt_grade ||= params[:grade]
  end

  def belt_length
    @belt_length ||= params[:length_min].to_i..params[:length_max].to_i
  end

  def belt_width
    @belt_width ||= params[:width_min].to_i..params[:width_max].to_i
  end

  def mills_list_with_machine_count_by_machine_attributes
    mills.map do |mill|
      [
        mill,
        MillMachine.machines_with_attributes(mill, machine_attributes)
      ]
    end
  end

  def mills
    Mill.having_machine_with_attributes machine_attributes
  end

  def machines_list_with_belt_count_by_belt_attributes
    machines.map do |machine|
      [
        machine,
        MachineBelt.belts_with_attributes(machine, belt_machine_attributes)
      ]
    end.select { |arr| arr.last.present? }
  end

  def machines
    Machine.having_belts_with_attributes belt_machine_attributes
  end
end
