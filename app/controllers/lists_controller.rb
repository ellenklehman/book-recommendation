class ListsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @list = List.new
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to user_list_path(@user, @list) }
      format.js
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list was saved!"
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @list = List.find(params[:id])
  end

private

  def list_params
    params.require(:list).permit(:name)
  end
end
