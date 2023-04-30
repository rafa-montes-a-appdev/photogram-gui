class PhotosController < ApplicationController

  def index
    @list_of_images = Photo.order({ :created_at => :desc}).all
    render({ :template => "photo_templates/index.html.erb" })
  end

  def details
    img_id = params.fetch("path_id")
    @the_image = Photo.where({ :id => img_id}).first
    render({ :template => "photo_templates/details.html.erb" })
  end

  def delete
    img_id = params.fetch("path_id")
    the_image = Photo.where({ :id => img_id }).first
    the_image.destroy
    redirect_to("/photos")
  end

def insert
  new_photo = Photo.new
  new_photo.caption = params.fetch("query_caption")
  new_photo.image = params.fetch("query_image")
  new_photo.owner_id = params.fetch("query_owner_id").to_i
  new_photo.save
  redirect_to("/photos")
end

  #  Parameters: {"quey_image"=>"sdsd", "query_caption"=>"fdsdfsd", "query_owner_id"=>"117"}
end
