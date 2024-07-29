class RatingsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @rating = @post.ratings.new(rating_params)
    @rating.user = current_user

    respond_to do |format|
      if @rating.save
        format.html { redirect_to post_url(@post), notice: "Rating was added." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @post, notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { redirect_to @post, alert: "Unable to update rating." }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end
