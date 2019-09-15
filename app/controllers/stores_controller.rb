class StoresController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @stores = Store.order(id: :desc).page(params[:page]).per(25)
    #if logged_in?
      #@sale = current_user.sales.build  # form_with 用
      #@sales = current_user.sales.order(id: :desc).page(params[:page])
    #end
  end

  def show
    #@store_frm = @store.find_by(id: params[:format])
    if logged_in?
      @store = Store.find(params[:id])  # form_with 用
      @sales = @store.sales.order(id: :desc).page(params[:page])
      #@stores = current_user.stores.order(id: :desc).page(params[:page])
      @sale = current_user.sales.build  # form_with 用
      #@sales = current_user.sales.order(id: :desc).page(params[:page])
    end

  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.build(store_params)
    if @store.save
      flash[:success] = '店舗を登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '店舗の登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @store.destroy
    flash[:success] = '店舗を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def store_params
    params.require(:store).permit(:name, :prefecture, :city, :address)
  end
  
  def correct_user
    @store = current_user.stores.find_by(id: params[:id])
    unless @store
      redirect_to root_url
    end
  end
end
