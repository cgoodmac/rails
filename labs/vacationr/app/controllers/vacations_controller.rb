class VacationsController < ApplicationController
  # GET /vacations
  # GET /vacations.json
  def index
    @vacations = Vacation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacations }
    end
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacation }
    end
  end

  # GET /vacations/new
  # GET /vacations/new.json
  def new
    @vacation = Vacation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacation }
    end
  end

  # GET /vacations/1/edit
  def edit
    @vacation = Vacation.find(params[:id])
  end

  # POST /vacations
  # POST /vacations.json
  def create
    place = Geocoder.search(params[:vacation][:name])
    lat = place[0].latitude
    long = place[0].longitude
    addr = place[0].address

    @vacation = Vacation.new

    @vacation.name = addr
    @vacation.lat = lat
    @vacation.long = long
    @vacation.zoom = params[:vacation][:zoom]

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to @vacation, notice: 'Vacation was successfully created.' }
        format.json { render json: @vacation, status: :created, location: @vacation }
      else
        format.html { render action: "new" }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacations/1
  # PUT /vacations/1.json
  def update
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      if @vacation.update_attributes(params[:vacation])
        format.html { redirect_to @vacation, notice: 'Vacation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation = Vacation.find(params[:id])
    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to vacations_url }
      format.json { head :no_content }
    end
  end
end
