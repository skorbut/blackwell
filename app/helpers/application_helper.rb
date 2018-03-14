module ApplicationHelper
  def document_tags
    DocumentTag.order(count: "DESC").limit(5)
  end
end
