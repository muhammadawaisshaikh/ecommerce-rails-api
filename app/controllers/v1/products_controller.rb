class V1::ProductsController < ApplicationController
    def index
        product = Product.all
        render json: { product: product }, status: :ok
    end
  end