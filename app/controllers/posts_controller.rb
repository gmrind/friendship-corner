class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    @comments = Comment.all
    @user = current_user
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @@comment = Comment.new
    @post = Post.find(params[:id])
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @post.post_date = DateTime.now
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
      else
        format.html { redirect_to posts_path, alert: 'Post cannot be blank...!!! Please type some words in post.' }
        format.json { render json: @posts.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
<<<<<<< HEAD
    @post.liked_by current_user
    redirect_to :back
  end
  def downvote
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    redirect_to :back
  end

=======
    @post.upvote_from current_user
    redirect_to :back
  end


>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :post_date, :user_id)
    end
end
