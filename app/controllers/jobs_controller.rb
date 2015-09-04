class JobsController < ApplicationController

  before_action :find_job, only: [:show, :edit, :destroy, :update]
  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render "edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :url, :company)
  end

end
