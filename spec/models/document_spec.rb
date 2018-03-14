require 'rails_helper'

describe Document do
  it 'contains the expected fields' do
    document = Document.new
    expect(document).to respond_to :author
    expect(document).to respond_to :author_id
    expect(document).to respond_to :folder
    expect(document).to respond_to :title
    expect(document).to respond_to :content
    expect(document).to respond_to :tags
    expect(document).to respond_to :created_at
    expect(document).to respond_to :updated_at
  end

  describe '#save' do
    it 'stores the document' do
      document = Document.new(author: 'Karsten Senz', folder: '/', content: 'test', tags: ['test', 'example'])
      expect(document.save!).to be_truthy
    end

    context "with title given in params and content" do
      it 'keeps the title from the params' do
        content = "\n # some title\n more content for the actual document"
        Document.new(content: content, title: "explicit title").save

        expect(Document.first.title).to eq "explicit title"
      end
    end

    context "with title in content" do
      it 'extracts the title from the content' do
        content = "\n # some title\n more content for the actual document"
        Document.new(content: content).save

        expect(Document.first.title).to eq "some title"
      end
    end

    context "without any title" do
      it 'has an empty title' do
        content = "\n ## some second level title\n more content for the actual document"
        Document.new(content: content).save

        expect(Document.first.title).to be_nil
      end
    end

    context "with tags in the markdown" do
      it "populates the tags array" do
        content = "\n #some #tags in the content\n #more #tags in the next line"
        Document.new(content: content).save
        expect(Document.first.tags).to contain_exactly("#some", "#tags", "#more")
      end
    end
  end
end
