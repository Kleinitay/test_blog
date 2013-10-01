class PostsController < ApplicationController
	def index
  		@posts = Post.all
  		#render :json => @posts
	end

	def main
	end

	def filter
		filter_labels = params[:labels].split(',')
		@posts = Post.joins(:labels).where(:name => filter_labels)
		render :json => @posts
	end

	def new
		@post = Post.new
	end

	def edit
	  @post = Post.find(params[:id])
	  render :json => @post
	end

	def update
	  @post = Post.find(params[:id])
	 
	  if @post.update(params[:post])
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def create
  		@post = Post.new(params[:post])
 
  		if @post.save
	    redirect_to @post
	  else
	    render 'new'
	  end
	end

	def show
  		@post = Post.find(params[:id])
  		render :json => @post
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	 
	  redirect_to posts_path
	end
 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end