class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  def index
    @items = Item.all.order(archived: :asc, due_date: :desc)
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_url, notice: "Item was successfully created."
    else
      redirect_to items_url, alert: "Item creation failed..."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      flash.now[:alert] = "Invalid input, item update failed..."
      render :edit, alert: "Item update failed..."
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully deleted."
  end

  def archive_toggle
    @item = Item.find(params[:item_id])
    @item.update(archived: !@item.archived)
    redirect_to items_url
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :due_date, :archived)
    end
end
