class NotesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @note = @item.notes.create(note_params)
    if @note.valid?
      redirect_to item_path(@item), notice: "Note successfully created!"
    else
      redirect_to item_path(@item), alert: "Error: Must provide body text..."
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @note = @item.notes.find(params[:id])
    @note.destroy
    redirect_to item_path(@item), notice: "Note successfully deleted!"
  end

  private
    def note_params
      params.require(:note).permit(:body)
    end
end
