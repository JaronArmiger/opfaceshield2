class OrdersController < ApplicationController
	before_action :account_set_up?
	before_action :has_address?
	before_action :my_order?, only: [:show, :destroy]
	before_action :order_processed?, only: [:destroy]
	before_action :is_admin?

	def index
		if current_user.admin?
			@orders = Order.order('created_at DESC')
		else
			@processed_orders = current_user_account.orders.where("processed = true")
			@unprocessed_orders = current_user_account.orders.where("processed = false")
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
	  @order = Order.new
	end

	def create
	  order_attributes = order_params
	  
	  if (address_id = order_params[:address_id])
	  	address = Address.find(address_id)
	  	order_attributes[:street_address] = address[:street_address]
	  	order_attributes[:city] = address[:city]
	  	order_attributes[:state] = address[:state]
	  	order_attributes[:zipcode] = address[:zipcode]
	  end
	  order_attributes.delete(:address_id)
	  @order = current_user_account.orders.build(order_attributes)
	  if @order.save
	  	flash[:success] = "Order placed!"
	  	redirect_to order_path(@order)
	  	#OrderMailer.confirmation(current_user, @order).deliver_now
	  else
	  	render :new
	  end
	end

	def destroy
	  flash[:success] = "Order canceled!"
	  
	  #OrderMailer.cancellation(current_user, @order).deliver_now
	  #AdminMailer.cancellation(current_user, @order).deliver_now
	  @order.destroy
	  redirect_to root_path
	end

	private

	  def order_params
	  	params.require(:order).permit(:num_shields, :num_adjusters,
	  								  :message, :street_address, :city,
	  								  :state, :zipcode, :address_id)
	  end

	  def account_set_up?
	  	if !current_user_account && !current_user.admin?
	  	  flash[:alert] = "Finish account set up before placing order."
	  	  store_location
	  	  redirect_to new_account_path
	  	end
	  end

	  def has_address?
	  	if !current_user.admin? && current_user_account.addresses.empty?
	  	  flash[:alert] = "Add address to your account before placing order."
	  	  store_location
	  	  redirect_to new_address_path
	    end
	  end

	  def my_order?
	  	unless current_user.admin?
	  	  @order = current_user_account.orders.find_by(id: params[:id])
	  	  redirect_to root_url if @order.nil?
	  	end
	  end

	  def order_processed?
	  	unless current_user.admin?
	  	  @order = Order.find_by(id: params[:id])
	  	  flash[:notice] = "Your order cannot be cancelled because it's already on the way!
	  	  					You can email our administrator at #{administrator.email} and
	  	  					we can try to work towards a solution."
	  	  redirect_to root_url if @order.processed?
	  	end
	  end

	  def is_admin?
	  	if current_user.admin?
	  	 redirect_to admin_orders_path
	  	end
	  end
end
