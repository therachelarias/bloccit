class SummariesController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts
    @summary = Summary.new
  end


  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts
    @summary = Summary.new(params.require(:summary).permit(:description))
    authorize @summary
    if @summary.save!
      flash[:notice] = "Summary saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving summary. Please try again."
      render :new
    end
  end
end
