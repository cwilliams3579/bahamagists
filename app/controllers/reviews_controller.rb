class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_job
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :check_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource :through => :current_user

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.job_id = @job.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to jobs_path, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant), notice: 'Review was successfully destroyed.' }
    end
  end

  private
  
  def set_review
    @review = Review.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def check_user
    unless (@review.user == current_user) || (current_user.admin?)
      redirect_to root_url, alert: "Sorry, this review belongs to someone else"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end