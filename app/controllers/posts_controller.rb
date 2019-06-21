class PostsController < ApplicationController
  include PostsHelper
  def index
    @posts = Post.allPosts(current_user.id)
    @post = Post.new
    @like = Like.new
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
    @like = Like.new
	end
end
