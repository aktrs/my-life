class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)

    @graphs_data = @users.map do |user|
      graphs = user.graphs.order(:age)
      {
        user_id: user.id,
        name: user.name,
        graphs: graphs.map { |graph| { age: graph.age, value: graph.value } }
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(8).reverse_order
  end
end
