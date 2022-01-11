class TagsController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(tag_name: params[:tag_name])
    @posts = @tag.posts
  end
  
end
