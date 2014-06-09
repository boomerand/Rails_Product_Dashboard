class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = Product.find(params[:id]).comments.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Category.find(params[:product][:category].to_i).products.new(new_product_params)
    if @product.save
      flash[:notice] = "New Product Successfully Created!"
      redirect_to(products_path)
    else
      @errors = @user.errors.full_messages
      render(new_product_path)
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id]);
    # render :text => params.inspect

    if @product.update(new_product_params)
      flash[:notice] = "Product information has been updated!"
      redirect_to(products_path)
    else
      @errors = @product.errors.full_messages
      render(edit_product_path(@product))

    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to(products_path)
  end

  private
    def new_product_params
      params.require(:product).permit(:name, :pricing, :description, :category_id)
    end
end
