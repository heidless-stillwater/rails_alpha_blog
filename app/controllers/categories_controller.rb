class CategoriesController < ApplicationController
  before_action :require_admin, except: [ :index, :show ]

  def index
    per_page = 5
    @categories = Category.paginate(page: params[:page], per_page: per_page)
  end

  def show
    @category = Category.find(params[:id])
    # puts "show::@category.name: #{@category.name}"
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created Successfully"
      redirect_to @category
    else
      render "new"
    end
    # new_category = Category.create(name: "Travel")
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
