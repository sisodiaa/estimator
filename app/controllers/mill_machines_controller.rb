class MillMachinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mill
  before_action :set_mill_machine, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  # GET /mill_machines
  # GET /mill_machines.json
  def index
    @mill_machines = @mill.mill_machines.all.order(id: :asc)
  end

  # GET /mill_machines/1
  # GET /mill_machines/1.json
  def show
  end

  # GET /mill_machines/new
  def new
    @mill_machine = @mill.mill_machines.new
  end

  # GET /mill_machines/1/edit
  def edit
  end

  # POST /mill_machines
  # POST /mill_machines.json
  def create
    @mill_machine = @mill.mill_machines.build(mill_machine_params)

    respond_to do |format|
      if @mill_machine.save
        format.html { redirect_to mill_machine_path(@mill, @mill_machine), notice: 'Mill machine was successfully created.' }
        format.json { render :show, status: :created, location: mill_machine_path(@mill, @mill_machine) }
      else
        format.html { render :new }
        format.json { render json: @mill_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mill_machines/1
  # PATCH/PUT /mill_machines/1.json
  def update
    respond_to do |format|
      if @mill_machine.update(mill_machine_params)
        format.html { redirect_to mill_machine_path(@mill, @mill_machine), notice: 'Mill machine was successfully updated.' }
        format.json { render :show, status: :ok, location: mill_machine_path(@mill, @mill_machine) }
      else
        format.html { render :edit }
        format.json { render json: @mill_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mill_machines/1
  # DELETE /mill_machines/1.json
  def destroy
    @mill_machine.destroy
    respond_to do |format|
      format.html { redirect_to mill_machines_url(@mill), notice: 'Mill machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mill
      @mill = Mill.find_by(code: params[:mill_code])
    end

    def set_mill_machine
      @mill_machine = @mill.mill_machines.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mill_machine_params
      params.require(:mill_machine).permit(:machine_id, :quantity)
    end

    def set_breadcrumbs
      @breadcrumbs = [['Home', root_path], [@mill.name.titleize, mill_path(@mill)], 'Machines']
    end
end
