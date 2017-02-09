class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # GET /ideas

  def index
    @ideas = Idea.all
  #  @tweets = Tweet.all
  end

  # GET /ideas/1
  def show
    @idea = Idea.find(params[:id])
  end

  # GET /ideas/new
  def new
    @idea = current_user.ideas.new
  end

  # GET /ideas/1/edit
  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  # POST /ideas
  def create
  @idea = current_user.ideas.new(idea_params)

    if @idea.save
      redirect_to ideas_url, notice: 'Idea was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ideas/1
  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update(idea_params)
      redirect_to ideas_url, notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ideas/1
  def destroy
  @idea = current_user.ideas.find(params[:id])
  @idea.destroy
  redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:topic, :method, :category, :element, :action, :tag)
    end
end
