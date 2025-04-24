# Below are the routes for madmin
namespace :madmin do
  resources :events
  resources :resources
  resources :users
  resources :forum_categories
  resources :forum_posts
  resources :forum_threads
  resources :forum_subscriptions
  root to: "dashboard#show"
end
