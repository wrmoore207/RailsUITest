class ResourcesController < ApplicationController
  def new
    @resource = Resource.new
    render partial: "resources/form_modal", formats: [:html]
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to resource_list_path, notice: "Resource created successfully." }
      end
    else
      render partial: "resources/form_modal", status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :posted_at, :category, :description, :fulfilled)
  end
end
