class HomesController < ApplicationController
  def top
    @tag_lists = Tag.all
  end
  
end
