class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new # Needed to instantiate the form_with
  end

  def create
    @list = List.new(list_params)
    if @list.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
    else
      @list = List.new
      render 'new', status: :unprocessable_entity
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
