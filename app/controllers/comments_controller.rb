class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @comments = Comment.includes(:user)
    @users = User.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @user = current_user
  end

  # GET /comments/new
  def new
    @comment = Comment.new(:user => current_user)
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to :back, alert: 'Comment cannt be blank.!!!' }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to :back, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
<<<<<<< HEAD
    @comment.liked_by current_user
    redirect_to :back
  end
  def downvote
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
=======
    @comment.upvote_from current_user
>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :time_comment, :user_id, :post_id)
    end
end
