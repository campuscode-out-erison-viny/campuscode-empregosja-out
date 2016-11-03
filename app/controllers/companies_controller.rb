class CompaniesController < ApplicationController

  def show
    @companies = Company.all
    @company = Company.find params[:id]
    @jobs = @company.jobs
  end
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)

    if @company.persisted?
      redirect_to company_path(@company)
    else
      flash[:notice] = "Não foi possível criar a empresa"
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end