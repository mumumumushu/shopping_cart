class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order,only: [:show, :edit, :update, :destroy]
  after_action :reset_session_error,uniqueness: true
  


  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.all
    @orders.each do |order|
        order.sum
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show

   @order.sum

  end

  # GET /orders/new
  def new
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)
    @order.order_created_at = Time.now.localtime
    @order.order_last_edited_at = Time.now.localtime

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def reset_session_error
      session[:input_error]= nil
      session[:num_error]= nil 
      session[:price_error]= nil
      session[:name_error]= nil
      
    end


    

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_created_at, :sum_price, :order_last_edited_at,
                                    :order_name)
    end
    
end
