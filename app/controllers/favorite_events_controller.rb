class FavoriteEventsController < ApplicationController
  before_action :set_event
  
  def create
    if Favorite.create(favorited: @event, user: current_user)

      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
      # redirect_to @event, notice: "event was added to favorites"
    else
      flash[:danger] = "Oops something went wrong!"
      redirect_to @event
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @event.id, user_id: current_user.id).first.destroy
    redirect_to @event, notice: 'Event was removed from favorites'
  end
  
  private
  
  def set_event
    @event = Event.find(params[:event_id] || params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "The page you requested does not exist"
      redirect_to root_url
  end
end