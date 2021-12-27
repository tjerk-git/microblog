class PostsController < ApplicationController
  require 'securerandom'

  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_session

  before_action :authenticate_user!, only: %i[ edit destroy new create stats]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def stats
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def heart 
     @heart = Heart.create(post_id: params[:id], sessions: session[:current_user])
     redirect_to posts_url
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post.slug), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post.slug), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_slug(params[:slug])
    end

    def set_session
      if !session[:current_user]
        session[:current_user] = SecureRandom.hex
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :slug, photos: [])
    end
end
