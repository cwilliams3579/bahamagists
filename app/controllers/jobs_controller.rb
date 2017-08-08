class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :through => :current_user
  respond_to :js, :json, :html

  def index
    search = params[:term].present? ? params[:term] : nil
    @jobs = if search
      Job.search(search)
    else  
      Job.all
    end
    @jobs = Job.paginate(:page => params[:page], :per_page => 3)
    @categories = Category.all
  end

  def autocomplete
    render json: Job.search(params[:query], {
      fields: ["title^5", "company"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
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
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
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
    @job.destroy
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "The page you requested does not exist"
      redirect_to jobs_url
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private
  
  def set_job
    @job = Job.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "The page you requested does not exist"
      redirect_to jobs_url
  end

  def job_params
    params.require(:job).permit(:image, :title, :company, :url, :description, :term, :city, category_ids: [])
  end  
end
