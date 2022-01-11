class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def comment
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new(comment_content: params[:comment_content], user_id: @current_user.id, post_id: params[:id])
    @comments = @post.comments
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to @post
    else
      render :show
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to @post
    end
  end

end
