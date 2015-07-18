class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment did not save. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment was not deleted. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
