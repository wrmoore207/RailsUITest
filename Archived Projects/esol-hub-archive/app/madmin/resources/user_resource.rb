class UserResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :email
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :first_name
  attribute :last_name
  attribute :moderator

  # Associations
  attribute :forum_threads
  attribute :forum_posts
  attribute :forum_subscriptions

  # Add scopes to easily filter records
  # scope :published

  # Add actions to the resource's show page
  # member_action do |record|
  #   link_to "Do Something", some_path
  # end

  # Customize the display name of records in the admin area.
  # def self.display_name(record) = record.name

  # Customize the default sort column and direction.
  # def self.default_sort_column = "created_at"
  #
  # def self.default_sort_direction = "desc"
end
