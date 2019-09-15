class ToppagesController < ApplicationController
  def index
    #if logged_in?
     # @sale = current_user.sales.build  # form_with 用
     # @sales = current_user.sales.order(id: :desc).page(params[:page])
    #end
    #@sales = Sales.order(id: :desc).page(params[:page])
    @stores = Store.order(id: :desc).page(params[:page]).per(25)
    #@sales = Sale.order(id: :desc).page(params[:page]).per(25)
    #binding.pry
    
  end
end
