class TagsController < ApplicationController
  before_action :find_tag, only: [:destroy, :show]
  
  def index
    @show_tag = Tag.all
  end

  def edit
    @set_tag = Tag.new
  end

#   def update
#     @set_tag = Tag.new(tag_params)
#     if @set_tag.save
#     end
#   end

  def show
    @tag_list = @set_tag.listings
  end

  def destroy
    @set_tag.delete
  end

  
  private
  def tag_params
    params.require(:desc_tag).permit(:desc_tag)
  end
  def find_tag
    @set_tag = Tag.find(params[:id]) 
  end
end

