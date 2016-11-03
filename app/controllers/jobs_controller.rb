class JobsController < ApplicationController

  before_action :target_job, only: [:show, :edit, :update]
  before_action :companies_all, only: [:new, :edit]

  def show
  end
  
  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)

    if @job.persisted?
      redirect_to job_path(@job)
    else
      companies_all
      flash[:notice] = "Não foi possível criar a vaga"   
      render :new
    end
  end

  def edit
  end

  def update
    @job.update job_params

    if @job.valid?
      redirect_to job_path(@job)
    else
      redirect_to edit_job_path(@job), notice: 'Não foi possível atualizar a vaga'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_id, :location, :category, :description, :featured)
  end

  def target_job
    @job = Job.find params[:id]
  end

  def companies_all
    @companies = Company.all
  end

end