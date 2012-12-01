  class GodsController < ApplicationController
  # GET /gods
  # GET /gods.json
  def index
    @gods = God.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gods }
    end
  end

  # GET /gods/1
  # GET /gods/1.json
  def show
    @god = God.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @god }
    end
  end

  # GET /gods/new
  # GET /gods/new.json
  def new
    @god = God.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @god }
    end
  end

  # GET /gods/1/edit
  def edit
    @god = God.find(params[:id])
  end

  # POST /gods
  # POST /gods.json
  def create
    @god = God.new(params[:god])

    respond_to do |format|
      if @god.save
        format.html { redirect_to @god, notice: 'God was successfully created.' }
        format.json { render json: @god, status: :created, location: @god }
      else
        format.html { render action: "new" }
        format.json { render json: @god.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gods/1
  # PUT /gods/1.json
  def update
    @god = God.find(params[:id])

    respond_to do |format|
      if @god.update_attributes(params[:god])
        format.html { redirect_to @god, notice: 'God was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @god.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gods/1
  # DELETE /gods/1.json
  def destroy
    @god = God.find(params[:id])
    @god.destroy

    respond_to do |format|
      format.html { redirect_to gods_url }
      format.json { head :no_content }
    end
  end

  def search
    query = params[:query]
    if query.present?
      @gods = God.text_search(query) # class method
    else
      @gods = God.all
    end
  end





end
