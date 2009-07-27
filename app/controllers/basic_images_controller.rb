class BasicImagesController < AssetsController
  
  def index
    @basic_images = BasicImage.all.paginate(:per_page => 40, :page => params[:page])
  end
end
