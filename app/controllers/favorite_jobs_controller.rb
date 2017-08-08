class FavoriteJobsController < ApplicationController
  before_action :set_job
  respond_to :js, :json, :html
  def create
    if Favorite.create(favorited: @job, user: current_user)

      respond_to do |format|
        format.html { redirect_to @job }
        format.js
      end
      # redirect_to @job, notice: "Job was added to favorites"
    else
      flash[:danger] = "Oops something went wrong!"
      redirect_to @job
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @job.id, user_id: current_user.id).first.destroy
    redirect_to @job, notice: 'Job was removed from favorites'
  end
  
  private
  
  def set_job
    @job = Job.find(params[:job_id] || params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "The page you requested does not exist"
      redirect_to root_url
  end
end