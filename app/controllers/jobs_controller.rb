class JobsController < ApplicationController

  def show
    @job = Job.find params[:id]
  end
  
  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.create(job_params)

    if @job.persisted?
      redirect_to job_path(@job)
    else
      @companies = Company.all
      flash[:notice] = "Não foi possível criar a vaga"
      
      render :new
    end
  end

  def edit
    @job = Job.find params[:id]
    @companies = Company.all
  end

  def update
    job = Job.find params[:id]
    job.update job_params

    if job.valid?
      redirect_to job_path(job)
    else
      redirect_to edit_job_path(job), notice: 'Não foi possível atualizar a vaga'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_id, :location, :category, :description, :featured)
  end

end