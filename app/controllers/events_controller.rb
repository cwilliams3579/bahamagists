class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    if params[:query].present?
      @events = Event.search(params[:query])
    else
      @events = Event.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    end
    @categories = Category.order(:name)
    authorize @events, :index?
  end

  def show
    authorize @event, :show?
    # @comment = Comment.new
    # @comment.event_id = @event.id
  end

  def new
    @event = Event.new
     authorize @event, :new?
  end

  def edit
    authorize @event, :edit?
  end

  def create
    @event = Event.new(event_params)
    authorize @event, :create?
    @event.organizer = current_user
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @event, :update?
    if @event.update(event_params)
      flash[:notice] = "Event updated!"
      redirect_to @event
    else
      flash.now[:alert] = "Event not updated!"
      render "edit"
    end
  end

  def destroy
    @event.destroy
    authorize @event, :destroy?
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:danger] = "The page you requested does not exist"
      redirect_to events_url
    end

    def event_params
      params.require(:event).permit(:title, :description, :address, :start_date, :end_date, :start_time, :end_time, :tag_list, :user_id , :category_id, :seats, {images: []})
    end
end
