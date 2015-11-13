class DocumentsController < ApplicationController
  before_action :require_login
  
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.create(document_params)
    @document.save!
    render :show
  end

  private

  def document_params
      params.require(:document).permit(:title, :author, :content)
  end
end
