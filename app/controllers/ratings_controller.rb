class RatingsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @rating = @post.rating.new(rating_params)
    @rating.user = current_user

    if @rating.save
      format.html { redirect_to post_url(@post), notice: "Rating was added." }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to @rating.post, notice: "Rating was successfully updated."
    else
      render :edit, notice: "Rating was not updated."
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
