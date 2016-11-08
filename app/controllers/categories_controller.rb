class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def show
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new params_require
    
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

    def params_require
      params.require(:category).permit(:name)
    end

end
