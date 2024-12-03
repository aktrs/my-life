class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @labels = @user.graphs.map(&:age)  # 年齢
    @values = @user.graphs.map(&:value)  # 値
    @data_with_links = @user.graphs.map do |graph|
      {
        id: graph.id,
        comment: graph.comment  # コメント
      }
    end
  end
end
