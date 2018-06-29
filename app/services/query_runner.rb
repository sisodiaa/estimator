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
    when "maker"
      get_mills_list_with_machine_count_query_by_machine_maker
    when "model"
      get_mills_list_with_machine_count_query_by_machine_model
    when "grade"
      get_mills_list_by_belt_grade
    when 'recommend'
      get_belt_recommendation_list
    end
  end

  def get_mills_list_with_machine_count_query_by_machine_maker
    mills = Mill.with_machines_by_maker(machine_maker)

    mills_with_count = mills.map do |mill|
      [
        mill,
        MillMachine.count_of_machines_by_maker_in_a_mill(mill, machine_maker)
      ]
    end

    [query_type, machine_maker, mills_with_count]
  end

  def get_mills_list_with_machine_count_query_by_machine_model
    mills_with_count =
      MillMachine.mills_with_machine_model(machine_model).map do |mill_machine|
        [mill_machine.mill, mill_machine.quantity]
      end

    [query_type, machine_name, mills_with_count]
  end

  def get_mills_list_by_belt_grade
    mill_machines = MillMachine.includes(:belts).where(belts: { id: belt_id })
    mills = Mill.where(mill_machines: mill_machines)

    [query_type, belt_grade, mills]
  end

  def get_belt_recommendation_list
    mill = Mill.find_by(code: mill_code)
    installed_machines = mill.machines
    belts_list = Belt.for_machines(installed_machines)
    procured_belts_list = Belt
      .procured_for_machines_in_mill(mill, installed_machines)

    recommended_belts_list = belts_list - procured_belts_list

    [query_type, mill.name, recommended_belts_list]
  end

  def query_type
    params[:type]
  end

  def machine_maker
    params[:maker]
  end

  def machine_model
    params[:model]
  end

  def belt_id
    params[:grade]
  end
  
  def belt_grade
    Belt.find(belt_id).grade
  end

  def machine_name
    Machine.find(params[:model]).machine_name
  end

  def mill_code
    params[:mill]
  end
end
