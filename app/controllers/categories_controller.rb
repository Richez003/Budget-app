class CategoriesController < ApplicationController

  def index; end
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @categories = current_user.categories
    else
      render 'splash'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)
    if @category.save
    flash[:notice] = "#{@category.name} created successfully!"
    redirect_to category_index_path
  else
    flash[:alert] = @category.errors.full_messages.first
    render :new
  end
end

private

def category_params
  params.require(:category).permit(:name, :icon)
end
end
