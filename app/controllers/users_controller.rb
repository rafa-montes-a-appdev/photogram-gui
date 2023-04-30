class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb" })
  end

  def details
    username = params.fetch("path_id")
    @the_user = User.where({ :username => username }).at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/details.html.erb"})
    end

  end

  def insert
    new_user = User.new
    new_user.username = params.fetch("query_username")
    new_user.save
    new_url = "/users/" + new_user.username
    redirect_to(new_url)
  end

  def update
    user_id = params.fetch("path_id")
    the_user = User.where({ :id => user_id }).first
    the_user.username = params.fetch("query_update_user")
    the_user.save
    new_url = "/users/" + the_user.username
    redirect_to(new_url)
  end

end
