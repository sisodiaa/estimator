class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    query_type, results = QueryRunner.new.call query_parameters

    @result = ResultFormatter.new.call(query_type, results)
    @breadcrumbs = [['Home', root_path], 'Results']
  end

  private

  def query_parameters
    request.query_parameters
  end
end
