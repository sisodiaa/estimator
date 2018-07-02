class DashboardController < ApplicationController
  def index
  end

  def show
    response = QueryRunner.new(request.query_parameters).call
    @result = QueryResult.new(response).call
    @breadcrumbs = [['Home', root_path], 'Results']
  end
end
