class Document
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps
  include Mongoid::TagCollectible::Tagged

  TITLE_REGEXP = /^(\s*# )([\wÄÖÜäöüß ]*)(.*)$/
  TAGS_REGEXP = /(#)([\wÄÖÜäöüß]+)/

  field :author, type: String
  field :author_id, type: BSON::ObjectId
  field :folder, type: String
  field :title, type: String
  field :content, type: String
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
    self.title ||= titles.compact.first
    true
  end

  def extract_tags
    return true if content.blank?
    extracted_tags = content.lines.map do |line|
      line.scan(TAGS_REGEXP).map { |matches| matches[1] }
    end
    self.tags = extracted_tags.flatten.uniq.map(&:downcase)
    true
  end
end
