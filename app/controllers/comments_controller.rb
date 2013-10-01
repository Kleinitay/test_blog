class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    if @post.comments.create(params[:comment])
      render :json => { success: true }
    else 
      render :json => {success: false}, status: 422
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render :json => { success: true }
  end
end
