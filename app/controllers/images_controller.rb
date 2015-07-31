class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit]
  # before_action :belongs_to_user, only: [:edit, :destroy]
  before_action :authenticate, except: [:index]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
    # redirect_to root_path if !belongs_to_user
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save

      redirect_to images_path(@image)
    else

      redirect_to new_image_path
    end
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to images_path(@image)
    else
      redirect_to edit_image_path
    end
  end

  def upvotes
    @image = Image.find(params[:id])
    unless current_user.id == @image.user.id
      @image.upvotes += 1
    end
    flash[:notice] = @image.upvotes
    if @image.save
      redirect_to :back
    else
      redirect_to images_path
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to root_path
    end
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :url, :upvotes)
  end

end
