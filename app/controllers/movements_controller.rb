class MovementsController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :with => [:app_to_move]

  # GET /movements
  # GET /movements.json
  def index
    #@movements = Movement.all.order(:datetime)
    @movements = Movement.paginate(:page => params[:page], :per_page => 10).order(:datetime)
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(movement_params)
    @movement.fill(movement_params)
    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1
  # PATCH/PUT /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to @movement, notice: 'Movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.json
  def destroy
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def to_move
    @movement = Movement.new
    @movement.fill(params)
    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  def tag_to_move
    movement = Movement.new
    movement.tag_fill(params[:id_item])
    if movement.save
      render json: movement
    else
      movement.rollback_active_record_state!
    end
  end

  #Create movements from json
  def app_to_move

    #data = request.body.read
    #params = JSON.parse(data)
    movements_list = params['_json']
    movements_list.each do|app_params|
      movement = Movement.new
      movement.app_fill(app_params)
      if not movement.save
        render json: "Movement were not successfully created."
      end
    end
    render json: "Movements were successfully created"
  end

  #testar envio de json (fail)
  def test_app_move

    movements = Collector::Movement.all
    #route_for (app_to_move, json: [movements: movements], :via => [:post])

  end

  def movements_to_app

    movements = Movement.all
    render json: movements

  end

  def dashboard

    @availables = Movement.availables
    @unavailables = Movement.unavailable

  end

  def timeline
    
  end

  def count_type(type_id)
    Movement.type.where(type: type_id)
  end

  def for_sector

    @sectors = Sector.all

  end

  def for_product

    @types = Type.all

    
  end

  def for_floor

    @floors = Floor.all

  end

  def availability_moves

    @availables = Movement.availables
    @unavailables = Movement.unavailable

  end

  def moved_sotck

  end

  def moved_item_stock

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_params
      params.require(:movement).permit(:datetime, :item_id, :status_id, :sector_id, :floor_id, :item_price)
    end
end
