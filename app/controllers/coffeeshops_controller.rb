class CoffeeshopsController < ApplicationController
  before_action :set_coffeeshop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /coffeeshops
  # GET /coffeeshops.json
  def index
    @coffeeshops =  current_user.coffeeshops.order(created_at: :desc)
  end

  # GET /coffeeshops/1
  # GET /coffeeshops/1.json
  def show
  end

  # GET /coffeeshops/new
  def new
    @coffeeshop = Coffeeshop.new
  end

  # GET /coffeeshops/1/edit
  def edit
  end

  # POST /coffeeshops
  # POST /coffeeshops.json
  def create
    @coffeeshop = Coffeeshop.new(coffeeshop_params)
    @coffeeshop.user = current_user

    respond_to do |format|
      if @coffeeshop.save
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully created.' }
        format.json { render :show, status: :created, location: @coffeeshop }
      else
        format.html { render :new }
        format.json { render json: @coffeeshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffeeshops/1
  # PATCH/PUT /coffeeshops/1.json
  def update
    respond_to do |format|
      if @coffeeshop.update(coffeeshop_params)
        format.html { redirect_to @coffeeshop, notice: 'Coffeeshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffeeshop }
      else
        format.html { render :edit }
        format.json { render json: @coffeeshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffeeshops/1
  # DELETE /coffeeshops/1.json
  def destroy
    @coffeeshop.destroy
    respond_to do |format|
      format.html { redirect_to coffeeshops_url, notice: 'Coffeeshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffeeshop
      @coffeeshop = Coffeeshop.find(params[:id])
      redirect_to root_url, notice: 'Access Denied!' unless current_user.id == @coffeeshop.user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffeeshop_params
      params.require(:coffeeshop).permit(:name, :address, :website, :description)
    end
end
