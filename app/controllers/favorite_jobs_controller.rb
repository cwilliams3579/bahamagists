class FavoriteJobsController < ApplicationController
  before_action :set_job
  
  def create
    if Favorite.create(favorited: @job, user: current_user)
      redirect_to @job, notice: "Job was added to favorites"
    else
      redirect_to @job, alert: "Something went wrong...*sad panda*"
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @job.id, user_id: current_user.id).first.destroy
    redirect_to @job, notice: 'Job was removed from favorites'
  end
  
  private
  
  def set_job
    @job = Job.find(params[:job_id] || params[:id])
  end
end