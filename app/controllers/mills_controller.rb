class MillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mill, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  # GET /mills
  # GET /mills.json
  def index
    @mills = Mill.all
  end

  # GET /mills/1
  # GET /mills/1.json
  def show
  end

  # GET /mills/new
  def new
    @mill = Mill.new
  end

  # GET /mills/1/edit
  def edit
  end

  # POST /mills
  # POST /mills.json
  def create
    @mill = Mill.new(mill_params)

    respond_to do |format|
      if @mill.save
        format.html { redirect_to @mill, notice: 'Mill was successfully created.' }
        format.json { render :show, status: :created, location: @mill }
      else
        format.html { render :new }
        format.json { render json: @mill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mills/1
  # PATCH/PUT /mills/1.json
  def update
    respond_to do |format|
      if @mill.update(mill_params)
        format.html { redirect_to @mill, notice: 'Mill was successfully updated.' }
        format.json { render :show, status: :ok, location: @mill }
      else
        format.html { render :edit }
        format.json { render json: @mill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mills/1
  # DELETE /mills/1.json
  def destroy
    @mill.destroy
    respond_to do |format|
      format.html { redirect_to mills_url, notice: 'Mill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breadcrumbs
      @breadcrumbs = [['Home', root_path], 'Mills']
    end

    def set_mill
      @mill = Mill.find_by(code: params[:code])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mill_params
      params.require(:mill).permit(:name, :location, :code)
    end
end
