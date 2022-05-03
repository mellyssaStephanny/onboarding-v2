class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def search
    unless params[:query].blank?
      @results = Page.search( params[:query] )
    end
  end

  def index
    filter = Product
    filter = filter.where(name: /.*#{params[:name]}.*/i ) if params[:name]
    filter = filter.where(description: /.*#{params[:description]}.*/i ) if params[:description]

    render json: { products: filter.all }
  end

  def show
    @product = Product.find(params[:id])

    if @product.nil?
      render json: {}, status: :not_found
    else
      render json: product, status: :ok
    end
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    return render json: {}, status: :not_found if product.nil?

    if product.update(product_params)
      render json: { product: product }, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if product.destroy
      render json: { sucess: "Product was successfully destroyed" }
    else
      render json: { error: product.errors, status: :not_found }
    end
  end

  private

  def error_handler
    render json: { error: true }, status: :error
  end

  def product_params
    params.permit(:sku, :name, :description, :price, :amount)
  end

  def set_product
    product = Product.find_by(id: params[:id])
  end

end