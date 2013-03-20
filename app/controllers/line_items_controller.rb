class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url       }
        format.js  { @current_item = @line_item}
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy

    if params[:product_id] then
# TODO need to use @cart.id to ensure only this users line_item is accessed.
      current_item = LineItem.find_by_product_id(params[:product_id] )
    else
      current_item = LineItem.find(params[:id])
    end

    if current_item
      current_item.quantity -= 1
      puts current_item.quantity
      if current_item.quantity <= 0
        current_item.destroy
      else
        current_item.save
      end
    else
      current_item.destroy
    end

    respond_to do |format|
      format.html { redirect_to store_url  }
      format.json { head :no_content }
    end
  end

   def delete

  if params[:product_id] then
    current_item = LineItem.find_by_product_id(params[:product_id] )
  else
    current_item = LineItem.find(params[:id])
  end

    if current_item
      current_item.quantity -= 1
      puts current_item.quantity
      if current_item.quantity <= 0
        current_item.destroy
      else
        current_item.save
      end
    else
      current_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to store_url  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:id, :product_id, :cart_id)
    end
end
