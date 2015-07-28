class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    
    authorize favorite

    if favorite.save
      flash[:notice] = "This post has been favorited!"
      redirect_to [post.topic, post]
    else
      flash[:notice] = "This post could not be favorited."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    
    authorize favorite

    if favorite.destroy
      flash[:notice] = "This post has been unfavorited!"
      redirect_to [post.topic, post]
    else
      flash[:notice] = "This post could not be unfavorited."
      redirect_to [post.topic, post]
    end
  end
end
