class RelationshipsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @relationship = Relationship.new(followed_id: @current_user.id, follower_id: params[:user_id])
    @relationship.save
    flash[:notice] = "フォローしました"
    redirect_to User.find(params[:user_id])
  end

  def destroy
    @relationship = Relationship.find_by(followed_id: @current_user.id, follower_id: params[:user_id])
    @relationship.destroy
    flash[:notice] = "フォローから外しました"
    redirect_to User.find(params[:user_id])
  end

end
