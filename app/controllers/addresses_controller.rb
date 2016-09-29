class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:destroy,:make_it_default]
  before_action :set_default_of_default_address_id

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = current_user.addresses.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  #def show
  #end

  # GET /addresses/new
  def new
    @address = current_user.addresses.new
  end

  # GET /addresses/1/edit
  #def edit
  #end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = current_user.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to addresses_path, notice: 'Address was successfully created.' }
        #format.json { render :index, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  #def update
  ##  respond_to do |format|
  #    if @address.update(address_params)
  #      format.html { redirect_to @address, notice: 'Address was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @address }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @address.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_it_default
    current_user.default_address_id= @address.id
    current_user.save
    redirect_to  addresses_path 
    #respond_with(@user_addresses)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = current_user.addresses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:user_id, :consignee_name, :consignee_address)
    end

    def set_default_of_default_address_id
      #定义变量 并且保证存在
      @_default_id=current_user.default_address_id

      if not ( @_default_id  and  current_user.addresses.exists?(id:@_default_id))
          @_default_id =  current_user.addresses.first.id
          current_user.default_address_id= current_user.addresses.first.id
          current_user.save

      end
      
    end
end
