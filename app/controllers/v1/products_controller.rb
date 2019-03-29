class V1::ProductsController < ApplicationController
    def index
        product = Product.all
        render json: { product: product }, status: :ok
    end

    def create
        product = Product.new(product_params)
        if product.save
          render json: product, status: :created
        else
          render json: { errors: product.errors }, status:    :unprocessable_entity
    end
        

    def show
        product = Product.find(params[:id])
        render json: product, product: :ok
    end

    def update
        product = Product.find(params[:id])
        if product.update(product_params)
          render json: product, status: :ok
        else
          render json: { errors: product.errors }, status: :unprocessable_entity
        end
    end

    private
        
    def product_params
        params.require(:product).permit(:name, :price, :description, :category_id, :stock)
    end
    
  end