class CommoditiesController < ApplicationController

	before_action  :find_order, :authenticate_user!
	def index
		
	end
	def create
		
		@commodity = @order.commodities.create(commodity_params)
	

		

		respond_to do |format|
      if @commodity.save

    		@order.order_last_edited_at = Time.now.localtime
				@order.save

      	
        format.html { redirect_to order_path(@order),notice: 'Commodity was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
      	session[:input_error]= "Input error."
  			session[:name_error]="Can not have any symbol except \"_\"." if @commodity.errors[:c_name].any?
				session[:price_error]="Must be positive number." if @commodity.errors[:c_price].any?
				session[:num_error]="Must be positive integer." if @commodity.errors[:c_num].any?

        format.html { redirect_to order_path(@order),notice: 'Input error.'}
        format.json { render json: order_path(@order).errors, status: :unprocessable_entity }
      end
    end

	end

	def destroy
		@commodity= @order.commodities.find(params[:id])
		@commodity.destroy
		@order.order_last_edited_at = Time.now.localtime

    respond_to do |format|
      format.html { redirect_to order_path(@order), notice: 'Commodity was successfully destroyed.' }
      format.json { head :no_content }
    end

	end

	def show
	
		
	end

	private
		def find_order
			@order = Order.find(params[:order_id])
			
		end

		
		

		def commodity_params
			params.require(:commodity).permit(:c_name,:c_price,:c_num)
			
		end
		

end
