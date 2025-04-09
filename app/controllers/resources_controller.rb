class ResourcesController < ApplicationController
  def new
    @resource = Resource.new
    respond_to do |format|
      format.html do
        if turbo_frame_request?
          render partial: "resources/form_modal", locals: { resource: @resource }
        else
          render :new
        end
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "new_resource_modal",
          partial: "resources/form_modal",
          locals: { resource: @resource }
        )
      end
    end
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
