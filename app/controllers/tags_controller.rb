class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @stories = @tag.stories
  end

  # def index
  #   @tags = Tag.all
  # end

  def search
    @tags = Tag.where("name LIKE ?", "%#{params[:query]}%")
  end

  def autocomplete
    @tags = Tag.where("name LIKE ?", "#{params[:query]}%").limit(10)
    render json: @tags
  end
end
