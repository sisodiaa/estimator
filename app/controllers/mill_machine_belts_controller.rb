class MillMachineBeltsController < ApplicationController
  before_action :set_mill
  before_action :set_mill_machine
  before_action :set_mill_machine_belt, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  # GET /mill_machine_belts
  # GET /mill_machine_belts.json
  def index
    @mill_machine_belts = @mill_machine.mill_machine_belts.all
  end

  # GET /mill_machine_belts/1
  # GET /mill_machine_belts/1.json
  def show
  end

  # GET /mill_machine_belts/new
  def new
    @mill_machine_belt = @mill_machine.mill_machine_belts.new
  end

  # GET /mill_machine_belts/1/edit
  def edit
  end

  # POST /mill_machine_belts
  # POST /mill_machine_belts.json
  def create
    @mill_machine_belt = @mill_machine.mill_machine_belts.build(mill_machine_belt_params)

    respond_to do |format|
      if @mill_machine_belt.save
        format.html do
          redirect_to mill_machine_belt_path(@mill, @mill_machine, @mill_machine_belt),
                      notice: 'Mill machine belt was successfully created.'
        end
        format.json do
          render :show, status: :created, 
            location: mill_machine_belt_path(@mill, @mill_machine, @mill_machine_belt)
        end
      else
        format.html { render :new }
        format.json { render json: @mill_machine_belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mill_machine_belts/1
  # PATCH/PUT /mill_machine_belts/1.json
  def update
    respond_to do |format|
      if @mill_machine_belt.update(mill_machine_belt_params)
        format.html do
          redirect_to mill_machine_belt_path(@mill, @mill_machine, @mill_machine_belt),
                      notice: 'Mill machine belt was successfully updated.'
        end
        format.json do
          render :show, status: :ok, 
            location: mill_machine_belt_path(@mill, @mill_machine, @mill_machine_belt)
        end
      else
        format.html { render :edit }
        format.json { render json: @mill_machine_belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mill_machine_belts/1
  # DELETE /mill_machine_belts/1.json
  def destroy
    @mill_machine_belt.destroy
    respond_to do |format|
      format.html { redirect_to mill_machine_belts_url(@mill, @mill_machine), notice: 'Mill machine belt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mill
      @mill = Mill.find_by(code: params[:mill_code])
    end

    def set_mill_machine
      @mill_machine = @mill.mill_machines.find_by(id: params[:machine_id])
    end

    def set_mill_machine_belt
      @mill_machine_belt = @mill_machine.mill_machine_belts.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mill_machine_belt_params
      params.require(:mill_machine_belt).permit(:belt_id)
    end

    def set_breadcrumbs
      @breadcrumbs = [
        ['Home', root_path],
        [@mill.name.titleize, mill_path(@mill)],
        [@mill_machine.machine.machine_name, mill_machine_path(@mill, @mill_machine)],
        'Belts'
      ]
    end
end
