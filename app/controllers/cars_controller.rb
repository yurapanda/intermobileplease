class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource


  # GET /cars
  # GET /cars.json
  def index
    if current_user.admin?
      @cars = Car.all
    else
      user = current_user.id
      @cars = Car.where(user: user)
    end

  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    
  
    if @car.user_id != current_user.id
      redirect_to cars_path
    else
      @car = Car.find(params[:id])
    end
    @owner = User.where(id: @car.user_id)

  end

  # GET /cars/new
  def new
    @car = Car.new
    @car.user_id = current_user.id
        @user_email = current_user.email
  end

  # GET /cars/1/edit
  def edit
     if @car.user_id != current_user.id
      redirect_to cars_path
    else
      @car = Car.find(params[:id])
    end
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id

    @first_name = current_user.first_name
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
   
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:plate_number, :car_model_id, :contact_number, :model_year, data: params[:user])
    end

end
