class Document
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  TITLE_REGEXP = /^(\s*# )(.*)$/
  TAGS_REGEXP = /(#\w+)/

  field :author, type: String
  field :author_id, type: BSON::ObjectId
  field :folder, type: String
  field :title, type: String
  field :content, type: String
  field :tags, type: Array
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  before_save :extract_title
  before_save :extract_tags

  search_in :author, :title, :content

  scope :by_author, ->(author) { where(author_id: author.id) }
  scope :having_text, ->(query) { full_text_search(query) }
  scope :newest_first, -> { order(created_at: "DESC") }


  def extract_title
    return true if content.blank?
    titles = content.lines.map do |line|
      Array(TITLE_REGEXP.match(line))[2]
    end
    self.title ||= titles.compact.first&.strip
    true
  end

  def extract_tags
    return true if content.blank?
    self.tags = content.lines.map { |line| line.scan(TAGS_REGEXP) }.flatten.uniq
    true
  end
end
