class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @jobs = Job.all

    @categories = Category.order(:name)
    @category_events = @category.events.order(created_at: :desc).paginate(page: params[:page], per_page: 1)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    # @category_id = @job.category.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The page you were looking for could be found."
      redirect_to(request.referrer || events_url)
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def require_admin
      if !signed_in? || (signed_in? and !current_user.admin?)
        flash[:danger] = "Only adminstrators can perform that action"
        redirect_to categories_path
      end
    end
end
