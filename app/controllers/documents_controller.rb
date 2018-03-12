class DocumentsController < ApplicationController
  before_action :require_login
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
  end

  def new
    document
  end

  def create
    @document = Document.new(author: current_user.name, author_id: current_user.id)
    @document.update(document_params)
    render :show
  end

  def update
    @document.update(document_params)
    render :show
  end

  private

  def document_params
    params.require(:document).permit(:title, :content)
  end

  def find_document
    @document = Document.find(params[:id])
  end
end
