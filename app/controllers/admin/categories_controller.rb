class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:show, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{@category.name}&api_key=#{Rails.application.secrets.gify_api_key}")
      raw_data = response.body
      parse_data = JSON.parse(raw_data)
      gifs = parse_data["data"]
      gifs.each do |gif|
        @category.gifs.create(name: @category.name, image_path: gif["images"]["fixed_height"]["url"])
      end
      flash[:notice] = "Gif successfully created"
      redirect_to admin_categories_path
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @gifs = @category.gifs
    @count = @gifs.all.count
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end


end
