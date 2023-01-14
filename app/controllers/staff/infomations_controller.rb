class Staff::InfomationsController < ApplicationController
  def new
    @infomation = current_user.infomations.new
  end

  def create
    
    @infomation = current_user.infomations.new(infomation_params)           
    tag_list = params[:infomation][:name].split(nil)  
    if @infomation.save                                         
      @infomation.save_tag(tag_list)                         
      redirect_back(fallback_location: root_path)          
    else
      redirect_back(fallback_location: root_path)          
    end
  end

  def index
    @tag_list = Tag.all
    @infomations = Infomation.all
  end

  def show
    @infomation = Infomation.find(params[:id])
    @infomation_tags = @infomation.tags
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  
  private
    def post_params
      params.require(:infomation).permit(:title, :body, :priority)
    end
end
