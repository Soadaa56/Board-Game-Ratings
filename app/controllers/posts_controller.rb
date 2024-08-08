class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]
  # skip_before_action :verify_authenticity_token, only: :fetch_board_games

  require Rails.root.join('lib', 'bgg_data_fetcher')

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order(:title)
  end

  # GET /posts/1 or /posts/1.json
  def show ; end

  # GET /posts/new
  def new
    @post = Post.new
    @post.ratings.build
  end

  # GET /posts/1/edit
  def edit ; end

  def image ; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    # Weird to iterate over each rating, but there will only be one at creation so no issuie of overiding data
    @post.ratings.each do |rating|
      rating.user = current_user
    end

    if @post.bgg_id.present?
      fetcher = BggDataFetcher.new
      @post.bgg_rating = fetcher.fetch_board_game_rating(@post.bgg_id)
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update


    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch_board_games
    if params[:query].present?
      @results = BggDataFetcher.new.fetch_board_game_search(params[:query])
      Rails.logger.info "Fetched results: #{@results.inspect}"
    else
      @results = []
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("query_results:"), partial: "posts/fetch_results", locals: { results: @results}
      end
      format.html {redirect_to new_post_path}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :bgg_id, :image_pin, ratings_attributes: [:id, :score])
    end
end
