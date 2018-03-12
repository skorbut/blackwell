class Document
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  field :author, type: String
  field :author_id, type: BSON::ObjectId
  field :folder, type: String
  field :title, type: String
  field :content, type: String
  field :tags, type: Array
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  search_in :author, :title, :content

  scope :by_author, ->(author) { where(author_id: author.id) }
  scope :having_text, ->(query) { full_text_search(query) }
  scope :newest_first, -> { order(created_at: "DESC") }
end
