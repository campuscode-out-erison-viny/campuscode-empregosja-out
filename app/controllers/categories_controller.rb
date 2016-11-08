class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def show
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new params_require
    @category.save
    redirect_to category_path(@category)
  end

  private

    def params_require
      params.require(:category).permit(:name)
    end

end
