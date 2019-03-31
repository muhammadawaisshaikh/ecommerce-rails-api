class V1::CategoriesController < ApplicationController
    def index
        category = Category.all
        render json: { category: category }, status: :ok
    end

    def create
        category = Category.new(category_params)
        if category.save
          render json: category, status: :created
        else
          render json: { errors: category.errors }, status:    :unprocessable_entity
        end
    end

    def show
        category = Category.find(params[:id])
        render json: category, category: :ok
    end

    def update
        category = Category.find(params[:id])
        if category.update(category_params)
          render json: category, status: :ok
        else
          render json: { errors: category.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        category = Category.find(params[:id])
        category.destroy
        head 204
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
    
end