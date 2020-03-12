Rails.application.routes.draw do



  # Routes for the Passenger account:

  # SIGN UP FORM
  get("/passenger_sign_up", { :controller => "passengers", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_passenger", { :controller => "passengers", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_passenger_profile", { :controller => "passengers", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_passenger", { :controller => "passengers", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_passenger_account", { :controller => "passengers", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/passenger_sign_in", { :controller => "passenger_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/passenger_verify_credentials", { :controller => "passenger_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/passenger_sign_out", { :controller => "passenger_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
