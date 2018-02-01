class CommentsController < ApplicationController

  before_action :set_comment, except: [:create]

  def edit
      @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was created successfully."}
        # NOTE: This needs to know which ID to pull in, so that's why
      else
        format.html { redirect_to(fallback_location: root_path, notice: "Comment failed to post!") }
        #when it can't go to the redirect above, it'll go to the home page. This is a fallback location. This is the rails 5 way, was different in earlier versions.
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_post_path(@comment.blog_post_id), notice: "Comment was updated successfully!"}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was destroyed!" }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:author, :comment_entry, :blog_post_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])

    end
end # ************* end of Class **************
