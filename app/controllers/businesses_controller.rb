class BusinessesController < ApplicationController

	def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params.merge(user_id: current_user.id))

    if @business.save
      redirect_to root_url, notice: 'Item was successfully created'
    else
      render :new
    end
  end

  private
  	def business_params
      params.require(:business).permit(:name, :address, :city, :user_id)
    end
end
