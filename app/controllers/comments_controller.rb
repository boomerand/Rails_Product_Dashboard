class CommentsController < ApplicationController
  def index
  end

  def show
    @comments = Comment.all
  end

  def new
  end

  def create
    # render :text => params.inspect
    @product = Product.find(params[:comment][:product_id])
    @comment = Product.find(params[:comment][:product_id]).comments.new(new_comment_params)
    if @comment.save
      redirect_to(product_path(@product))
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def new_comment_params
      params.require(:comment).permit(:comment, :product_id)
    end
end
