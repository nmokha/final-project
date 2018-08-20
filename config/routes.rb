Rails.application.routes.draw do
  # Routes for the Option resource:
  
  root "decisions#index"
  
  # CREATE
  get("/options/new", { :controller => "options", :action => "new_form" })
  post("/create_option", { :controller => "options", :action => "create_row" })

  # READ
  get("/options", { :controller => "options", :action => "index" })
  get("/options/:id_to_display", { :controller => "options", :action => "show" })

  # UPDATE
  get("/options/:prefill_with_id/edit", { :controller => "options", :action => "edit_form" })
  post("/update_option/:id_to_modify", { :controller => "options", :action => "update_row" })

  # DELETE
  get("/delete_option/:id_to_remove", { :controller => "options", :action => "destroy_row" })

  #------------------------------

  # Routes for the Decision resource:

  # CREATE
  get("/decisions/new", { :controller => "decisions", :action => "new_form" })
  post("/create_decision", { :controller => "decisions", :action => "create_row" })

  # READ
  get("/decisions", { :controller => "decisions", :action => "index" })
  get("/decisions/:id_to_display", { :controller => "decisions", :action => "show" })

  # UPDATE
  get("/decisions/:prefill_with_id/edit", { :controller => "decisions", :action => "edit_form" })
  post("/update_decision/:id_to_modify", { :controller => "decisions", :action => "update_row" })

  # DELETE
  get("/delete_decision/:id_to_remove", { :controller => "decisions", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
