class TagsController < ApplicationController

  def index
    @tags = Tag.order(:name)
    value_map = []
    tokens = @tags.tokens(params[:q]) if params[:q]
    if tokens.first.respond_to?(:each_value)
      value_map = tokens
    else
      tokens.each {|token| value_map << {id: token.name, name: token.name} }
    end
    respond_to do |format|
      format.json { render json: value_map }
    end
  end

  def create
    plate = Plate.find(params[:plate_id])
    plate.tags = []
    plate.add_tags(params[:tokens])
    plate.save
    render text: "placeholder"
  end
end