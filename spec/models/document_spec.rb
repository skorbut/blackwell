require 'rails_helper'

describe Document do
  it 'contains the expected fields' do
    document = Document.new
    expect(document).to respond_to :author
    expect(document).to respond_to :folder
    expect(document).to respond_to :title
    expect(document).to respond_to :content
    expect(document).to respond_to :tags
  end

  describe '#save' do
    it 'stores the document' do
      document = Document.new(author: 'Karsten Senz', folder: '/', content: 'test', tags: ['test', 'example'])
      expect(document.save!).to be_truthy
    end
  end
end
