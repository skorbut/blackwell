class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :author_id, type: BSON::ObjectId
  field :folder, type: String
  field :title, type: String
  field :content, type: String
  field :tags, type: Array
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
