class UsersController < ApplicationController
  def show
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 2)
    @liked_bookmarks =  Bookmark.liked_by(current_user).paginate(page: params[:page], per_page: 8)
  end
end