class AddressesController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @addresses = Address.all
  end
  
  def show
    @address = Address.find(params[:id ])
  end

  def new
    @address = Address.new
  end

  # # def create
  # #   @article = Article.find(params[:article_id])
  # #   @comment = @article.comments.create(comment_params)
  # #   redirect_to article_path(@article)
  # # end

  
  
  def create
    # byebug
    @user = User.find(params[:user_id])
    @address = @user.create_address(address_params)
    redirect_to user_path(@user)
  end
  
  # def edit
  #   @address = Address.find(params[:id])
    
  # end
  
  # def update
  #   @address = Address.find(params[:id])
    
  #   if @address.update(address_params)
  #     redirect_to @address
  #   else 
  #     render :new, status: :unprocessable_entity
  #   end
    
  # end
  
  # # def destroy
  # #   @article = Article.find(params[:article_id])
  # #   @comment = @article.comments.find(params[:id])
  # #   @comment.destroy
  # #   redirect_to article_path(@article), status: :see_other
  # # end
  def destroy
    @user =User.find(:user_id)
    @address =@user.address.find(params[:id])
    @address.destroy

    redirect_to user_path(@user), status: :see_other

  end


  private

  def set_user
    @user = User.find(params[:id])
  end
  def address_params
    params.require(:address).permit(:house_no,:street,:city,:state,:postal_code)
  end

end
