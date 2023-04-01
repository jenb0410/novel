class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def show
    # @chapters = @story.chapters
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url, notice: 'Story was successfully destroyed.'
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :description, :user_id)
  end
end
