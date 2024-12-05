class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @graphs = @user.graphs.order(:age)
    @labels = @graphs.map(&:age)  # 年齢
    @values = @graphs.map(&:value)  # 値
    @data_with_links = @graphs.map do |graph|
      {
        id: graph.id,
        comment: graph.comment  # コメント
      }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end
