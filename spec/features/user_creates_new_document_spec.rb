require 'rails_helper'

feature 'A user creates new a document' do
  context 'without logging in' do
    scenario 'it displays a login screen first' do
      visit new_document_path
      expect(page).to have_content 'Sign in'
    end
  end
  context 'with logging in' do
    scenario 'it displays the form' do
      user = create(:user)
      visit new_document_path(as: user)
      expect(page).to_not have_content 'Sign in'
      expect(page).to have_css('h1', 'New Document')
    end
    scenario 'it saves the new document' do
      user = create(:user, name: 'Bodo')
      visit new_document_path(as: user)
      fill_in 'Content', with: "\n# My new document\nMy content"
      click_button "Create Document"
      expect(Document.count).to eq 1
      expect(Document.first.title).to eq 'My new document'
      expect(Document.first.content).to eq "\r\n# My new document\r\nMy content"
      expect(Document.first.author).to eq 'Bodo'
      expect(Document.first.author_id).to eq user.id
    end
  end
end
