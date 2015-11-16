require 'rails_helper'

feature 'A user visits the root path' do
  context 'without logging in' do
    scenario 'it displays a login screen first' do
      visit root_path
      expect(page).to have_content 'Sign in'
    end
    scenario 'it does not display the side bar' do
      visit root_path
      expect(page).to_not have_css 'nav.Blackwell-nav'
    end
    scenario 'it has no link to new document' do
      visit root_path
      expect(page).to_not have_link 'Neuer Eintrag'
    end
    scenario 'it has no link to documents' do
      visit root_path
      expect(page).to_not have_link 'Alle Einträge'
    end
  end

  context 'with user logged in' do
    scenario 'it displays the side bar' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_css 'nav.Blackwell-nav'
    end
    scenario 'it displays the document list' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_selector('h1', text: 'All documents')
    end
    scenario 'it has a link to new document' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_link 'Neuer Eintrag'
    end
    scenario 'it has a link to documents' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_link 'Alle Einträge'
    end
    scenario 'it displays the users email as link to the edit action' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_link(user.email, href: edit_user_path(user.id))
    end
    scenario 'it displays link to sign out' do
      user = FactoryGirl.create(:user)
      visit root_path(as: user)
      expect(page).to have_link('Sign out')
    end

  end
end
