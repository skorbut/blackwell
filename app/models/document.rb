class Document
  include Mongoid::Document

  field :author, type: String
  field :folder, type: String
  field :title, type: String
  field :content, type: String
  field :tags, type: Array
end
