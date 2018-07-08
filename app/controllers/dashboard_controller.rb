class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    query_type, metadata, results = QueryRunner.new(request.query_parameters).call
    @result = QueryResult.new(query_type, metadata, results).call
    @breadcrumbs = [['Home', root_path], 'Results']
  end
end
