class PostsController < ApplicationController
  include PostsHelper
  def index
    @posts = allPosts
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to(root_path)
    end
  end

end
