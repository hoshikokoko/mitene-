class Staff::InfomationsController < ApplicationController
  def new
    @tag_list = Tag.all
    @infomation = Infomation.new
  end

  def create
    
    @infomation = Infomation.new(infomation_params)
    @infomation.staff_id = current_staff.id
    tag_list = params[:infomation][:name].split(nil)  
    if @infomation.save                                         
      @infomation.save_tag(tag_list)                         
      redirect_to staff_top_path        
    else
      @tag_list = Tag.all
      render :new        
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
    def infomation_params
      params.require(:infomation).permit(:title, :body, :priority)
    end
end
