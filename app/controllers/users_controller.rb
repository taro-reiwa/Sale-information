class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :mystores]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @sales = @user.sales.order(id: :desc).page(params[:page])
    @mystores = @user.stores.page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
    def mystores
    @users = User.find(params[:id])
    @mystores = @user.stores.page(params[:page])
    binding.pry
    counts(@stores)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
