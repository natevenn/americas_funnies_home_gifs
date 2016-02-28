class Admin::GifsController < Admin::BaseController
  def destroy
    @gif = Gif.find(params[:gif])
    @gif.destroy
    redirect_to admin_category_path(params[:id])
  end
end
