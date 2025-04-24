class Event < ApplicationRecord
    # validates :name, presence: true
    # validates :date, presence: true
    # validates :location, presence: true
    # validates :description, presence: true
    # validates :organizer, presence: true
    # validates :contact_info, presence: true
    # validates :event_type, presence: true
    # validates :capacity, numericality: { only_integer: true, greater_than: 0 }
    # validates :price, numericality: { greater_than_or_equal_to: 0 }
    # validates :status, inclusion: { in: %w[upcoming ongoing completed canceled] }
    # validates :image_url, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
    # validates :created_at, presence: true
    # validates :updated_at, presence: true
    # validates :tags, presence: true
    # validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    # validates :reviews_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    # validates :location_coordinates, format: { with: /\A-?\d+(\.\d+)?,-?\d+(\.\d+)?\z/, message: "must be in the format 'latitude,longitude'" }, allow_blank: true
    # validates :event_url, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
    # validates :social_media_links, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
    # validates :created_by, presence: true
    # validates :updated_by, presence: true
    # validates :event_duration, numericality: { only_integer: true, greater_than: 0 }
    # validates :event_duration_unit, inclusion: { in: %w[hours days weeks months] }
    # validates :event_schedule, presence: true
    # validates :event_schedule, format: { with: /\A(\d{1,2}:\d{2} [AP]M)(,\s\d{1,2}:\d{2} [AP]M)*\z/, message: "must be in the format 'HH:MM AM/PM'" }
    # validates :event_schedule, length: { maximum: 255 }
    # validates :event_schedule, uniqueness: { scope: :event_type, message: "should be unique for each event type" }
    # validates :event_schedule, allow_blank: true
    # validates :event_schedule, format: { with: /\A(\d{1,2}:\d{2} [AP]M)(,\s\d{1,2}:\d{2} [AP]M)*\z/, message: "must be in the format 'HH:MM AM/PM'" }
    # validates :event_schedule, length: { maximum: 255 }
end
