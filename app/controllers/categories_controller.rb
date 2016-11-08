class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def show
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new params_require
    
    if Category.find_by_name(@category.name).nil?
      @category.save
      
      redirect_to category_path(@category)
    else
      flash.now[:notice] = "Categoria já utilizada"

      render :new
    end
  end

  private

    def params_require
      params.require(:category).permit(:name)
    end

end
