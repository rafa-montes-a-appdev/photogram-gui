Rails.application.routes.draw do
  
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })

  get("/users/:path_id", { :controller => "users", :action => "details" })
  get("/photos/:path_id", { :controller => "photos", :action => "details" })

end
