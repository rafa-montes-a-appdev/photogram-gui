class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb" })
  end

  def details
    username = params.fetch("path_id")
    @the_user = User.where({ :username => username }).at(0)
    render({ :template => "user_templates/details.html.erb"})
  end

end
