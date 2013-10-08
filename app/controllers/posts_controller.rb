class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    if params[:filter].nil?
      @posts = Post.all
    else
      filter_labels = params[:filter].split(',')
      @posts = Post.joins(:labels).where(['Labels.name in (?)', filter_labels])
    end
    #render :json => @posts
  end

  def main
  end

  def new
    @post = Post.new
    @lables = ""
  end

  def edit
    @post = Post.find(params[:id])
    @labels = @post.labels.map(&:name).join(',')
    #render :json => @post
  end

  def update
    @post = Post.find(params[:id])
    labels = params[:post][:labels].split(',')
    @post.labels.clear
    labels.each do |label|
      @post.labels.build(name: label)
    end

    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    if @post.save
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(params[:post].slice(:title, :text))
    if params[:post][:labels].present?
      labels = params[:post][:labels].split(',')
      labels.each do |label|
        @post.labels.build(name: label)
      end
    end
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    #render :json => @post
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