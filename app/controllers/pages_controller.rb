class PagesController < ApplicationController
  
    def calendar
    end
    
    def home
    end

    def profile
    end

    def resource_list
      @resources = Resource.all
    
      # Filter logic
      if params[:status].present?
        @resources = @resources.where(fulfilled: params[:status] == "active")
      end
    
      # Search logic
      if params[:query].present?
        @resources = @resources.where("name ILIKE :q OR category ILIKE :q OR description ILIKE :q", q: "%#{params[:query]}%")
      end
    
      # Sort logic
      case params[:sort]
      when "name"
        @resources = @resources.order(name: :asc)
      when "posted_at"
        @resources = @resources.order(posted_at: :desc)
      when "category"
        @resources = @resources.order(category: :asc)
      end
    
      # Add resource counts for filter buttons
      @all_count = Resource.count
      @active_count = Resource.where(fulfilled: true).count
      @inactive_count = Resource.where(fulfilled: false).count
    end    
  end
  