class PostsController < ApplicationController

  
  def show
    @posts = Post.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @post["place_id"]})
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["image"] = params["post"]["image"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = @current_user["id"]
    @post.save
    else
      flash["notice"] = "You must login first."
    end
    redirect_to "/places/#{@post["place_id"]}"
  end

end
