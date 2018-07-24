class MachineBeltsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_machine
  before_action :set_machine_belt, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  # GET /machine_belts
  # GET /machine_belts.json
  def index
    @machine_belts = @machine.machine_belts.all.order(id: :asc)
  end

  # GET /machine_belts/1
  # GET /machine_belts/1.json
  def show
  end

  # GET /machine_belts/new
  def new
    @machine_belt = @machine.machine_belts.new
  end

  # GET /machine_belts/1/edit
  def edit
  end

  # POST /machine_belts
  # POST /machine_belts.json
  def create
    @machine_belt = @machine.machine_belts.build(machine_belt_params)

    respond_to do |format|
      if @machine_belt.save
        format.html do
          redirect_to machine_belt_path(@machine, @machine_belt),
            notice: 'Belt was successfully linked with Machine'
        end
        format.json { render :show, status: :created, location: machine_belt_path(@machine, @machine_belt) }
      else
        format.html { render :new }
        format.json { render json: @machine_belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_belts/1
  # PATCH/PUT /machine_belts/1.json
  def update
    respond_to do |format|
      if @machine_belt.update(machine_belt_params)
        format.html do
          redirect_to machine_belt_path(@machine, @machine_belt),
            notice: 'Record was successfully updated'
        end
        format.json { render :show, status: :ok, location: machine_belt_path(@machine, @machine_belt) }
      else
        format.html { render :edit }
        format.json { render json: @machine_belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_belts/1
  # DELETE /machine_belts/1.json
  def destroy
    @machine_belt.destroy
    respond_to do |format|
      format.html { redirect_to machine_belts_url(@machine), notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.find_by(id: params[:machine_id])
    end

    def set_machine_belt
      @machine_belt = @machine.machine_belts.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_belt_params
      params.require(:machine_belt)
        .permit(:belt_id, :length, :width, :quantity, :priority)
    end

    def set_breadcrumbs
      @breadcrumbs = [
        ['Home', root_path],
        [@machine.machine_name, machine_path(@machine)],
        'Belts'
      ]
    end
end
