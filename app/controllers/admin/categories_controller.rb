class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:show, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
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
