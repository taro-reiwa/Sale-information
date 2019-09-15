class SalesController < ApplicationController
  before_action :require_user_logged_in #全アクションはログインが必須
  before_action :correct_user, only: [:destroy]
  
  def create
    #binding.pry
    @sale = current_user.sales.build(sale_params)
    @sale.store_id = $sale
    
    #@sale = current_user.sales.build(store_id: :$sale)
    #binding.pry
    if @sale.save
      flash[:success] = '情報を投稿しました。'
      redirect_to root_url
    else
      @sale = current_user.sales.order(id: :desc).page(params[:page])
      flash.now[:danger] = '情報の投稿に失敗しました。'
      #redirect_back(fallback_location: root_path)
      #render 'toppages/index'
      #render 'stores/create'
      redirect_to root_url
    end
  end

  def destroy
    @sale.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def sale_params
    params.require(:sale).permit(:content)
  end
  
  def correct_user
    @sale = current_user.sales.find_by(id: params[:id])
    unless @sale
      redirect_to root_url
    end
  end
end
