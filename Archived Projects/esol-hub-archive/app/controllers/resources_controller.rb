class ResourcesController < ApplicationController
  include Secured

  before_action :set_resource, only: %i[ show edit update destroy ]

  def index
    @resources = Resource.all
    
    # Filter by category if provided
    if params[:category].present?
      @resources = @resources.where(category: params[:category])
    end
    
    # Sort by name or category
    case params[:sort]
    when 'name_asc'
      @resources = @resources.order(name: :asc)
    when 'name_desc'
      @resources = @resources.order(name: :desc)
    when 'category_asc'
      @resources = @resources.order(category: :asc)
    when 'category_desc'
      @resources = @resources.order(category: :desc)
    end
    
    # Get all available categories for the filter dropdown
    @categories = Resource.distinct.pluck(:category).compact.sort
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: "Resource was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Resource was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path, notice: "Resource was successfully deleted."
  end

  private
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:name, :category)
    end
end