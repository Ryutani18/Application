class SearchsController < ApplicationController

  def search
  end
  
  def index
    if params[:search] == ""
      render :search
    else
      @posts = Post.where('content LIKE ?', "%#{params[:search]}%")
      @users = User.where('name LIKE ?', "%#{params[:search]}%")
      @tags = Tag.where('tag_name LIKE ?', "%#{params[:search]}%")
    end
  end

end
