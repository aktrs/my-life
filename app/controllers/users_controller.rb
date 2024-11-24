class UsersController < ApplicationController
  def index
    @users = User.all

    @graphs_data = @users.map do |user|
      {
        user_id: user.id,
        name: user.name,
        graphs: user.graphs.order(:age).map{ |graph| { age: graph.age, value: graph.value } }
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(8).reverse_order
  end
end
