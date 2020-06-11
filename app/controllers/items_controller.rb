class ItemsController < ApplicationController
  before_action :set_items, only: [:show, :edit, :update, :destroy]

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
  end

  def show
  end

  def new
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items
    @items = Item.new
  end

  def edit
  end

  def create
    @items = Item.new(items_params)
    @items.business_id = current_business.id

    respond_to do |format|
      if @items.save
        format.html { redirect_to @items, notice: 'Successfully created item' }
        format.json { render :show, status: :created, location: @items }
      else
        format.html { render :new }
        format.json { render json: @items.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items

    respond_to do |format|
      if @items.update(items_params)
        format.html { redirect_to @items, notice: 'Item updated successfully.' }
        format.json { render :show, status: :ok, location: @items }
      else
        format.html { render :edit }
        format.json { render json: @items.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items

    # It is not recommended to destroy data ;)
    @items.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Successfully deleted item.' }
      format.json { head :no_content }
    end
  end

  private 

  def set_items
    @items = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:name, :price, :business_id)
  end
end
