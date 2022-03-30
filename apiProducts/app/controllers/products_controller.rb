class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def index
    products = Product.all
    render json: { products: products }
  end

  def show
    product = Product.find_by(id: params[:id])

    if product.nil?
      render json: {}, status: :not_found
    else
      render json: {product: product}, status: :ok
  end


  def create
    product = Product.new(product_params)

    if product.save
      render json: {product: product}, status: :created
    else
      render json:{}, status: :bad_request
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    if product.update(product_params)
      render json: {product: product}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if !product.nil?
      product.destroy
      render json: {product: product}, status: :ok
    else
      render json: {}, status: :not_found    
    end
  end

  private

  def error_handler
    render json: { error: true }, status: :error
  end

  def product_params
    params.require(:product).permit(:sku, :name, :price, :amount, :description)
  end
end