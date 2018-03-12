require 'rails_helper'

feature 'A user edits his settings' do
  context 'without logging in' do
    scenario 'it displays a login screen first' do
      user = create(:user)
      visit edit_user_path(user.id)
      expect(page).to have_content 'Sign in'
    end
  end
  context 'with logging in' do
    scenario 'it displays the edit view' do
      user = create(:user)
      visit edit_user_path(user.id, as: user)
      expect(page).to_not have_content 'Sign in'
      expect(page).to have_css('h1', 'Edit User')
    end
    scenario 'it populates the name field' do
      user = create(:user, name: 'Bodo')
      visit edit_user_path(user.id, as: user)
      expect(page).to_not have_content 'Sign in'
      expect(page).to have_css('h1', 'Edit User')
      expect(page).to have_selector('input', 'Bodo')
    end
    scenario 'it saves the new name' do
      user = create(:user, name: 'Bodo')
      visit edit_user_path(user.id, as: user)
      fill_in 'Name', with: 'Kalle'
      click_button "Update User"
      expect(User.find(user.id).name).to eq 'Kalle'
      expect(current_path).to eq root_path
    end
  end
end
