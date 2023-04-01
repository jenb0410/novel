class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def show
    @story = @chapter.story
  end

  def new
    @story = Story.find(params[:story_id])
    @chapter = Chapter.new
  end

  def create
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.build(chapter_params)

    if @chapter.save
      redirect_to story_chapter_path(@story, @chapter), notice: 'Chapter was successfully created.'
    else
      render :new
    end
  end

  def edit
    @story = @chapter.story
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to story_chapter_path(@chapter.story, @chapter), notice: 'Chapter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story = @chapter.story
    @chapter.destroy
    redirect_to story_path(@story), notice: 'Chapter was successfully destroyed.'
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content)
  end
end
