class TagsController < ApplicationController
  
  def index
    @tags = Tag.order(:name)
    value_map = []
    tokens = @tags.tokens(params[:q]) 
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
    plate_tags = params[:tokens].split(",")
    plate = Plate.find(params[:plate_id])
    plate_tags.each {|tag| plate.tags << Tag.find_or_create_by(name: tag)}
    plate.tags = plate.tags.uniq
    plate.save
  end

end
