class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.includes(:topic).friendly.find(params[:id])
    authorize @bookmark
  end

  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.topic = Topic.friendly.find(params[:topic_id])
    bookmark.user = current_user
    authorize bookmark
    if bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to bookmark.topic
    else
      flash[:error] = "There was an error creating the bookmark. Please try again."
      redirect_to bookmark.topic
    end
  end

  def update
    bookmark = Bookmark.friendly.find(params[:id])
    authorize bookmark
    if bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to [bookmark.topic, bookmark]
    else
      flash[:error] = "There was an error updating the bookmark. Please try again."
      redirect_to [bookmark.topic, bookmark]
    end
  end

  def destroy
    bookmark = Bookmark.friendly.find(params[:id])
    authorize bookmark
    if bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to bookmark.topic
    else
      flash[:error] = "There was an error deleting the bookmark. Please try again."
      redirect_to [bookmark.topic, bookmark]
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
