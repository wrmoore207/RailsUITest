Rails.application.routes.draw do
  get "mock_login", to: "sessions#mock", as: :mock_login
  delete "logout", to: "sessions#destroy", as: :logout

  # Public landing page
  root to: "pages#home"
  get "home", to: "pages#home"

  # Top-level calendar route
  get "calendar", to: "pages#calendar"

  # Messages Page
  get "messages", to: "pages#messages"

  # Profile Page
  get "profile", to: "pages#profile"

  # Resource List
  get "resource_list", to: "pages#resource_list"

  # RailsUI engine (development only)
  if Rails.env.development?
    mount Railsui::Engine, at: "/railsui"
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Admin pages under /rui namespace
  namespace :rui do
    get "about",         to: "pages#about"
    get "pricing",       to: "pages#pricing"
    get "dashboard",     to: "pages#dashboard"
    get "projects",      to: "pages#projects"
    get "project",       to: "pages#project"
    get "messages",      to: "pages#messages"
    get "message",       to: "pages#message"
    get "assignments",   to: "pages#assignments"
    get "calendar",      to: "pages#calendar"
    get "people",        to: "pages#people"
    get "profile",       to: "pages#profile"
    get "activity",      to: "pages#activity"
    get "settings",      to: "pages#settings"
    get "notifications", to: "pages#notifications"
    get "billing",       to: "pages#billing"
    get "team",          to: "pages#team"
    get "integrations",  to: "pages#integrations"
  end
end
