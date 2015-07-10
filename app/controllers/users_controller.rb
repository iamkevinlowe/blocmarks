class UsersController < ApplicationController
  def show
    @topics = Topic.visible_to(current_user).eager_load(:user, :bookmarks).paginate(page: params[:user_page], per_page: 2)
    @liked_bookmarks =  Bookmark.liked_by(current_user).eager_load(:topic).paginate(page: params[:liked_page], per_page: 8)
  end
end