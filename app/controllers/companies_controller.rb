class CompaniesController < ApplicationController

  def show
    @company = Company.find params[:id]
  end
  
  def new
    @company = Company.new
  end

  def create
    company = Company.create(company_params)

    if company.persisted?
      redirect_to company_path(company)
    else
      redirect_to new_company_path, notice: 'Não foi possível criar a empresa'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end