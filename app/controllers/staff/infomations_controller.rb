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
    @tag_lists = Tag.all
    @infomations = Infomation.all
  end

  def show
    @infomation = Infomation.find(params[:id])
    @infomation_tags = @infomation.tags
  end

  def edit
    @tag_lists = Tag.all
    @infomation = Infomation.find(params[:id])
    @tag_list = @infomation.tags.pluck(:name).join(' ')
  end

  def update
    @infomation = Infomation.find(params[:id])
    tag_list = params[:infomation][:name].split(nil)
    if @infomation.update(infomation_params)
      @old_infomation_tags = InfomationTag.where(infomation_id: @infomation.id)
      @old_infomation_tags.each do |old|
        old.delete
      end
      @infomation.save_tag(tag_list)

      redirect_to staff_top_path
    else
      render :edit
    end
  end

  def destroy
  end
  
  
  private
    def infomation_params
      params.require(:infomation).permit(:title, :body, :priority)
    end
end
