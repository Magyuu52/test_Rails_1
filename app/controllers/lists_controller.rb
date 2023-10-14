class ListsController < ApplicationController
  def index
    @lists = List.all
    @lists_count = List.where(@list_id).count
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title,:start,:finish,:finday,:memo))
    if @list.save
      flash[:notice] = "リストを新規登録しました"
      redirect_to :lists
    else
      render "new"
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params.require(:list).permit(:title,:start,:finish,:finday,:memo))
      flash[:notice] = "「#{@list.id}」の情報を更新しました"
      redirect_to :lists
    else
      render "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
     @list.destroy
     flash[:notice] = "リストを削除しました"
     redirect_to :lists
  end
end
