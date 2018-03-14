class DocumentsController < ApplicationController
  before_action :require_login
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = search_or_tag
  end

  def new
    @document = Document.new
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

  def search_or_tag
    if(params[:q])
      Document.by_author(current_user).having_text(params[:q]).newest_first
    elsif(params[:t])
      ::DocumentTag.find(params[:t]).tagged.by_author(current_user).newest_first
    else
      Document.by_author(current_user).newest_first
    end
  end
end
