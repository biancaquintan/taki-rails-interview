class BusinessController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @businesses = Business.new
  end

  def edit
  end

  def create
    @business = Business.new(businesses_params)
    @business.user_id = current_user.id

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Successfully created business' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(businesses_params)
        format.html { redirect_to @business, notice: 'Business updated successfully.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to business_index_path, notice: 'Successfully deleted business.' }
      format.json { head :no_content }
    end
  end

  private 

  def set_business
    @business = Business.find(params[:id])
  end

  def businesses_params
    params.require(:business).permit(:name, :address, :city, :user_id)
  end
end
