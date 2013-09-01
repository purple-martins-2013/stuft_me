class TagsController < ApplicationController
  
  def index
    @tags = Tag.order(:name)
    respond_to do |format|
      format.json { render json: @tags.where("name like ?", "%#{params[:q].capitalize}%") }
    end
  end

end
