class API::QueriesController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: results.to_json
  end

  private

  def results
    model.where(query_hash).distinct.pluck(*attributes).sort
  end

  def parameters
    @parameters ||= request.query_parameters
  end

  def model
    parameters[:model].classify.safe_constantize
  end

  def keys
    parameters[:keys].split ','
  end

  def values
    parameters[:values].split ','
  end

  def attributes
    parameters[:attributes].split(",").map(&:to_sym)
  end

  def query_hash
    Hash[keys.zip(values)].select { |key, value| key != ""  }
  end
end
