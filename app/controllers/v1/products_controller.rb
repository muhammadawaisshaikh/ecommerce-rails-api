class V1::ProductsController < ApplicationController
    def index
        product = Product.all
        render json: { product: product }, status: :ok
    end

    def show
        product = Product.find(params[:id])
        render json: product, product: :ok
    end
    
  end