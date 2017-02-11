class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(params[:id])
    idea.liked_by current_user
    redirect_to ideas_path, notice: "You liked this idea!"
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.unliked_by current_user
    redirect_to ideas_path, notice: "You unliked this idea!"
  end
end