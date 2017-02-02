class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def toggle
    respond_to :js


    @order = Order.find(params[:id])

    @order.ready = !@order.ready
    @order.save
    # if @order.update(ready: true)
    #   render
    # else
    #   render @order
    # end
  end

  # GET /orders
  def index

    @weeks = Order.upcoming_weeks
    @time = Time.now



    if params[:department].present?
      @late_orders = Order.where(department: params[:department]).where(:delivery_date.lt => Date.today).order_by(:delivery_date => :asc)

      @orders_per_week = Order.group_per_week(params[:department])

    else

      @late_orders = Order.where(department: "Paneelbouw").where(:delivery_date.lt => Date.today).order_by(:delivery_date => :asc)

      @orders_per_week = Order.group_per_week("Paneelbouw")

    end
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:delivery_date, :order_number, :customer, :status, :description, :production, :department, :quantity, :hours, :hours_diff, :hours_nc, :item_list, :material_bc, :material_pc, :ready)
    end
end
