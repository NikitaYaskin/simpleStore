class ItemsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /items
  def index
    @item = Item.new(item_params)
    @item.user_id = current_user.id
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :user_id)
    end
end
