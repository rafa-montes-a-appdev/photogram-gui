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

end
