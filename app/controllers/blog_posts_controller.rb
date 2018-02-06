class BlogPostsController < ApplicationController

  before_action :set_blog_post, only:  [:show, :edit, :update, :destroy]

  include ApplicationHelper

  def user_posts
    @user = User.find_by(username: params[:name])
  end

  def index
    @blog_posts = BlogPost.order(created_at: :desc).page(params[:page])
  end

  def show
    @comment = Comment.new
  end

  def edit
    owner_check(current_user, @blog_post)
  end

  def new
    # NOTE: INSTANCE VARIABLE MUST BE SINGULAR HERE
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
      #we'll write params later but adding here...
      #you need to have BlogPost.new twice. Both need to start with nil (empty form for new and empty for when you hit submit: create)
    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_post_path(id: @blog_post.id), notice: "Blog Post was created successfully"}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to blog_post_path(id: @blog_post.id),
        notice: "Blog post was updated successfully."}
      else
        format.html { render.edit }
      end
    end
  end

  def destroy
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your blog post was deleted."}
    end
  end

  private
    #you don't need an 'end' for private section
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :blog_entry, :user_id)
    end

end
