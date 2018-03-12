class DocumentsController < ApplicationController
  before_action :require_login

  def index
    @documents = Document.all
  end

  def new
    document
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    document.update_attributes(document_params)
    @document.save!
    render :show
  end

  private

  def document_params
    params.require(:document).permit(:title, :content)
  end

  def document
    @document ||= Document.new(author: current_user.name, author_id: current_user.id)
  end
end
