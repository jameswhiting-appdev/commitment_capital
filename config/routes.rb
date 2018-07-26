Rails.application.routes.draw do
  # Routes for the Landing_page resource:
  # CREATE
  get "/landing_pages/new", :controller => "landing_pages", :action => "new"
  post "/create_landing_page", :controller => "landing_pages", :action => "create"

  # READ
  get "/landing_pages", :controller => "landing_pages", :action => "index"
  get "/landing_pages/:id", :controller => "landing_pages", :action => "show"

  # UPDATE
  get "/landing_pages/:id/edit", :controller => "landing_pages", :action => "edit"
  post "/update_landing_page/:id", :controller => "landing_pages", :action => "update"

  # DELETE
  get "/delete_landing_page/:id", :controller => "landing_pages", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
