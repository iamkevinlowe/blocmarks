class TopicsController < ApplicationController
  def index
    @topics = Topic.eager_load(:user, :bookmarks).paginate(page: params[:page], per_page: 3)
    @topic = Topic.new
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @bookmark = Bookmark.new(topic: @topic)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      flash[:notice] = "New Topic was created successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error creating the topic. Please try again."
      redirect_to topics_path
    end
  end

  def destroy
    @topic = Topic.friendly.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was destroyed successfully."
      @topic = Topic.new
    else
      flash[:error] = "There was an error destroying the topic. Please try again."
    end
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
