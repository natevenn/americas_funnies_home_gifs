class Admin::CategoriesController < Admin::BaseController
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
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
