class ListsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @list = List.new
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.js
    end
  end

  def create
    @user = current_user
    @lists = List.all
    @list = current_user.lists.new(list_params)
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
    @list = List.find(params[:id])
    @user = User.find(@list.user_id)
  end

private

  def list_params
    params.require(:list).permit(:name)
  end
end
