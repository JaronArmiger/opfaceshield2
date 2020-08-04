module Admin
  class OrdersController < ApplicationController
    before_action :order_processed?, only: [:destroy]
  	def index
  	  @processed = Order.where("processed = true")
  	  @unprocessed = Order.where("processed = false")
  	end

  	def show
  	 @order = Order.find(params[:id])
  	end

  	def processed
  	  @processed = Order.where("processed = true")		
  	end

  	def unprocessed
  	  @unprocessed = Order.where("processed = false")
  	end

    def update
      @order = Order.find(params[:id])
      puts "ay"
      if params[:process] == "true"
        puts "process!"
        p @order
        @order.process
        p @order
        redirect_to admin_order_path(@order)
      elsif params[:process] == "false"
        puts "wrong"
        @order.unprocess
        redirect_to admin_order_path(@order)
      end
    end

    def destroy
      @order.destroy
      flash[:success] = "Order ##{@order.id} deleted!"
      redirect_to admin_orders_path
    end

    private

      def order_processed?
        @order = Order.find(params[:id])
        p @order
        unless @order.processed?
          redirect_to admin_orders_path
        end
      end
  end
end