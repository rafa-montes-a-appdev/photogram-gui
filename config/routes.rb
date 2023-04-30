Rails.application.routes.draw do
  
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })

  get("/users/:path_id", { :controller => "users", :action => "details" })
  get("/photos/:path_id", { :controller => "photos", :action => "details" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })
  get("/insert_photo", { :controller => "photos", :action => "insert" })
  get("/edit_photo/:path_id", { :controller => "photos", :action => "edit" })

  get("/insert_user", { :controller => "users", :action => "insert" })
  get("/update_user/:path_id", { :controller => "users", :action => "update" })

  get("/insert_comment", { :controller => "comments", :action => "new_comment"})

end
