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

  def edit
		@post = Post.find_by(id: params[:id])
	end

  def update
		@post = Post.find_by(id: params[:id])
    if @post.update(post_params)
			redirect_to(posts_path)
		else
			render 'edit'
		end
	end

  def destroy
		@post = Post.find_by(id: params[:id])
    if @post.destroy
			redirect_to posts_path
		else
			render 'index'
		end
	end

  def comments
		@post = Post.find_by(id: params[:id])
		@comments = @post.comments
		@comment = current_user.comments.build()
	end

  def like
    @like = Like.new
    @like.likeable_type = params[:type]
    @like.likeable_id = params[:likeable_id]
    @like.user_id = current_user.id
    if @like.save
      redirect_to(posts_url)
    end
  end

  def unlike
    @like = Like.find_by(id: params[:unlike_id])
    if @like.user_id == current_user.id
      @like.destroy
      redirect_to(posts_url)
    end
  end
end
