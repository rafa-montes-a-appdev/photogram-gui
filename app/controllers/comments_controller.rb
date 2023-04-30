class CommentsController < ApplicationController

  def new_comment
    new_com = Comment.new
    new_com.photo_id = params.fetch("query_photoid_comment")
    new_com.body = params.fetch("query_new_comment")
    new_com.author_id = params.fetch("query_authorid_comment")
    new_com.save
    new_url = "/photos/" + new_com.photo_id.to_s
    redirect_to(new_url)    
  end
end

#Parameters: {"query_photoid_comment"=>"951", "query_authorid_comment"=>"", "query_new_comment"=>"Enter a new comment..."}
