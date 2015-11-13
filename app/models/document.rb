class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :folder, type: String
  field :title, type: String
  field :content, type: String
  field :tags, type: Array
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
