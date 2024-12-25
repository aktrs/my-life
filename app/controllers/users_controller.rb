class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @graphs = @user.graphs.order(:age)
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @labels = @graphs.map(&:age)  # 年齢
    @values = @graphs.map(&:value)  # 値
    @data_with_links = @graphs.map do |graph|
      {
        id: graph.id,
        comment: graph.comment  # コメント
      }
    end
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id != current_user.id
       @isRoom = false
       @currentUserEntry.each do |cu|
         @userEntry.each do |u|
         if cu.room_id == u.room_id
           @isRoom = true
           @roomId = cu.room_id
          break
         end
       end
       break if @isRoom
      end
    end

    unless @isRoom
     @room = Room.new
     @entry = Entry.new
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

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end
