class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    # before_action :check_user
   def index
    @jobs = Job.all
  end


  def show
    @reviews = Review.where(job_id: @job.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  # def check_user
  #   unless current_user.admin?
  #     redirect_to root_url, alert: "Sorry, only an administrator can perform that action!"
  #   end
  # end

  def job_params
    params.require(:job).permit(:image, :title, :company, :url, :description)
  end  
end
