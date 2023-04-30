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
  new_url = "/photos/" + new_photo.id.to_s
  redirect_to(new_url)
end

def edit
  img_id = params.fetch("path_id")
  the_img = Photo.where({ :id => img_id }).first
  the_img.image = params.fetch("query_edit_url")
  the_img.caption = params.fetch("query_edit_caption")
  the_img.save
  new_url = "/photos/" + the_img.id.to_s
  redirect_to(new_url)
end

end
