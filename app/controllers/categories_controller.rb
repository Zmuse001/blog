# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index]
  def index
    @categories = Category.all
  end

  def show
    # Display category details and associated articles
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(categories_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, status: :see_other
  end
  # def destroy
  #   @category.destroy
  #   redirect_to category_articles_path(@category), notice: 'Category was successfully destroyed.'
  # end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:name, :description)
  end
end
