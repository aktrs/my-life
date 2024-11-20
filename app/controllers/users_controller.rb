class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5).reverse_order
    @users.each do |user|
      user.graphs = Graph.where(user_id: user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(8).reverse_order
  end
end
