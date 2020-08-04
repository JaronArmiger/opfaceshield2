class AddressesController < ApplicationController
	before_action :my_address?, only: [:edit, :update, :destroy]

	def new
		@address = Address.new
	end

	def create
		@address = current_user_account.addresses.build(address_params)
		if @address.save
		  flash[:success] = "New address added!"
		  puts "saved!"
		  redirect_back_or(account_path(current_user_account))
		else
		  render :new
		end
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
		  flash[:success] = "Address updated!"
		  redirect_to account_path(current_user_account)
		else
			render :edit
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		flash[:success] = "Address removed!"
		redirect_to account_path(current_user_account)
	end

	private

	  def address_params
	  	params.require(:address).permit(:street_address,
	  									:city, :state,
	  									:zipcode)
	  end

	  def my_address?
	  	unless current_user.admin?
	  		addresses = current_user_account.addresses
	  		has_address = addresses.any? { |a| a.id == params[:id].to_i }
	  		unless has_address
	  		  redirect_to root_path
	  		end
	  	end
	  end
end
