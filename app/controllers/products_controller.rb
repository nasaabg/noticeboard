class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :question]
  before_action :check_permission!, only: [:index]
  
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def my_products
    @products = current_user.products
  end

  def send_question
    owner = @product.user
    if params[:email].empty? || params[:message].empty?
      flash[:error] = "Type your email and message. Fields cannot be empty."
    elsif params[:email] == owner.email
      flash[:error] = "You cannot send email to yourself."
    else
      if UserMailer.question_email(owner.email, params[:email], params[:message], @product).deliver_now
        flash[:notice] = "Question sent!"
      else
        flash[:error] = "Something went wrong. Try again!"
      end
    end
    redirect_to @product
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @categories = Category.order(:name)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to my_products_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end

    def check_permission!
      unless current_user.admin?
        flash[:error] = "You don't have permissions to do this!"
        redirect_to root_url
      end
    end
end
